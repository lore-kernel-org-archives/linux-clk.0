Return-Path: <viresh.kumar@linaro.org>
Return-Path: <viresh.kumar@linaro.org>
Date: Mon, 8 May 2017 12:38:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sean Wang <sean.wang@mediatek.com>
Cc: rjw@rjwysocki.net, robh+dt@kernel.org, matthias.bgg@gmail.com,
	mark.rutland@arm.com, mturquette@baylibre.com,
	jamesjj.liao@mediatek.com, p.zabel@pengutronix.de,
	shunli.wang@mediatek.com, erin.lo@mediatek.com, jdelvare@suse.de,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: cpufreq: move Mediatek cpufreq
 dt-bindings document to proper place
Message-ID: <20170508070826.GF17010@vireshk-i7>
References: <1493997974-17699-1-git-send-email-sean.wang@mediatek.com>
 <1493997974-17699-6-git-send-email-sean.wang@mediatek.com>
 <20170508041827.GC17010@vireshk-i7>
 <1494224387.9662.10.camel@mtkswgap22>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1494224387.9662.10.camel@mtkswgap22>
List-ID: <linux-clk.vger.kernel.org>

On 08-05-17, 14:19, Sean Wang wrote:
> Okay, I will do it with you provided command again. 
> 
> What I did for the patch is just "git mv
> Documentation/devicetree/bindings/clock/mt8173-cpu-dvfs.txt
> Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt"
> and no any changing data in the content.

I was quite sure that you have done exactly that, but then we are
supposed to review and make sure you haven't done any mistakes.

That's where those options would make our life easier. Look at the
patch created by that command and you wouldn't see any diff at all.

-- 
viresh
