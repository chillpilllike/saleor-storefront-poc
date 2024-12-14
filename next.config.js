/** @type {import('next').NextConfig} */
const config = {
	images: {
		domains: ["secretgreen9.s3.ap-southeast-2.amazonaws.com"],
	},
	experimental: {
		typedRoutes: false,
	},
	// used in the Dockerfile
	output:
		process.env.NEXT_OUTPUT === "standalone"
			? "standalone"
			: process.env.NEXT_OUTPUT === "export"
			  ? "export"
			  : undefined,
};

export default config;
