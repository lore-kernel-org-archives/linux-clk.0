Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1526895204.2822.4.camel@baylibre.com>
Subject: Re: [PATCH v2 2/2] clk: meson: axg: let mpll clocks round closest
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date: Mon, 21 May 2018 11:33:24 +0200
In-Reply-To: <61fa49ae-e73e-957e-e28a-134102f82194@baylibre.com>
References: <20180515163652.19980-1-jbrunet@baylibre.com>
         <20180515163652.19980-3-jbrunet@baylibre.com>
         <61fa49ae-e73e-957e-e28a-134102f82194@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2018-05-15 at 18:46 +0200, Neil Armstrong wrote:
> On 15/05/2018 18:36, Jerome Brunet wrote:
> > Let the mpll dividers achieve the closest rate possible, even if
> > it means rounding the requested rate up.
> > 
> > This is done to improve the accuracy of the rates provided by these
> > plls to the audio subsystem
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> > 
[...]
> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applied
