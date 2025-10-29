import React from 'react'

type Props = {}

const Hero = (props: Props) => {
  return (
    <header className="bg-gradient-to-b from-white to-gray-50">
    <div className="container-max flex flex-col-reverse md:flex-row items-center gap-8 py-12 md:py-20">
      <div className="w-full md:w-1/2">
        <h1 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-gray-900 leading-tight">
        Connect. Trade. Thrive Together.
        </h1>
        <p className="mt-4 text-gray-600 max-w-xl">
        MarketMesh makes it easy for local businesses to find each other, collaborate, and strengthen community-based economies.
        </p>

        <div className="mt-6 flex flex-wrap gap-3">
          <a
            href="#get-started"
            className="inline-flex items-center px-5 py-3 bg-primary  rounded-md text-sm font-medium"
          >
            Get started
          </a>

          <button className="inline-flex items-center px-5 py-3 border border-gray-200 rounded-md text-sm text-gray-700 hover:bg-gray-50">
            <svg
              className="w-4 h-4 mr-2 text-accent"
              fill="currentColor"
              viewBox="0 0 20 20"
            >
              <path d="M6 4l10 6-10 6V4z" />
            </svg>
            Watch Video
          </button>
        </div>
      </div>

      <div className="w-full md:w-1/2 flex justify-center md:justify-end">
        <img
          src="https://images.unsplash.com/photo-1545239351-1141bd82e8a6?q=80&w=1200&auto=format&fit=crop"
          alt="3D preview"
          className="w-full max-w-xl rounded-lg shadow-lg object-cover"
        />
      </div>
    </div>
  </header>
  )
}

export default Hero