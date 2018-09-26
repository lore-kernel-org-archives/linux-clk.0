Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <2868cb9dc7536d8c3b94a83ce14694f93643d555.camel@baylibre.com>
Subject: Re: [PATCH 0/2] meson8b: add the CPU_DIV16 clock for the ARM TWD
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 carlo@caione.org,  khilman@baylibre.com, sboyd@kernel.org,
 mturquette@baylibre.com,  jianxin.pan@amlogic.com
Date: Wed, 26 Sep 2018 11:59:32 +0200
In-Reply-To: <CAFBinCAxB7MLK_dypQMkKD7=GeFSCN-L47Yoz3PqRssD88bZsw@mail.gmail.com>
References: <20180721172537.15639-1-martin.blumenstingl@googlemail.com>
	 <1532337101.26720.89.camel@baylibre.com>
	 <CAFBinCAxB7MLK_dypQMkKD7=GeFSCN-L47Yoz3PqRssD88bZsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2018-09-26 at 11:56 +0200, Martin Blumenstingl wrote:
> > Queued for 4.20
> 
> sorry, but I found out that this doesn't work.
> I'm not sure why I assumed that this has to be a CPU_DIV16 clock but
> it's most likely a "divide by 4" (more details below).
> so please feel free to revert this / drop the patches until I have
> more information

Dropped for now, feel free to send it again when things get more clear ;)
