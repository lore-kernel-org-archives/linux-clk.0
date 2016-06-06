Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:33094 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbcFFGTZ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 6 Jun 2016 02:19:25 -0400
Subject: Re: [RFC PATCH v1 4/6] PM / devfreq: event: support rockchip dfi
 controller
To: Thierry Reding <thierry.reding@gmail.com>
References: <1464947719-6245-1-git-send-email-hl@rock-chips.com>
 <1464947719-6245-5-git-send-email-hl@rock-chips.com>
 <20160603165426.GC21013@ulmo.ba.sec>
Cc: heiko@sntech.de, mark.yao@rock-chips.com, myungjoo.ham@samsung.com,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, airlied@linux.ie,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kyungmin.park@samsung.com, dianders@chromium.org,
	dbasehore@chromium.org, huangtao@rock-chips.com, typ@rock-chips.com
From: hl <hl@rock-chips.com>
Message-ID: <575515E0.8080108@rock-chips.com>
Date: Mon, 6 Jun 2016 14:19:12 +0800
MIME-Version: 1.0
In-Reply-To: <20160603165426.GC21013@ulmo.ba.sec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Thierry,

On 2016年06月04日 00:54, Thierry Reding wrote:
> On Fri, Jun 03, 2016 at 05:55:17PM +0800, Lin Huang wrote:
> [...]
>> +	ret = clk_prepare_enable(data->clk);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to enable clk: %d\n", ret);
>> +		clk_disable_unprepare(data->clk);
>> +		return ret;
>> +	}
> This is going to give you a large WARN. clk_prepare_enable() already
> leaves the clock in a proper state when it fails (i.e. it calls
> clk_unprepare() if the clk_enable() part failed), so calling
> clk_disable_unprepare() upon failure is going to unbalance the
> reference counts.
Thanks for reminding, i will fix it next version.
>
> Thierry

-- 
Lin Huang


