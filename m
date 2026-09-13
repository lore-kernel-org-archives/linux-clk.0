Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC6636F90D
	for <linux-clk@vger.kernel.org>; Sun, 13 Sep 2026 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334791; cv=none; b=kYF3QJRo+vhbOJUxyA5dTBvu+nolJbcKp3S+ZEUop9Lu/4+Hgg5b/mxYGq5+aE4jW6xS+wYPPZBg5aJGpMTY7ppI3lFG9VQYv0qsyt6mpoOeaBQ8DzrvZ5lIWcMWOBFiefu1G3+T3+dVSaGwJc4Qy7MhGAHZGyxkpvtPq28CfQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334791; c=relaxed/simple;
	bh=u6mcKlM2CEVDLAb1ydSNvueMv3v7ctmWVUuvqtxgxxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cn8ye37KPyTUljnq8X91El79krQ6RRkUHSNG8KuJxOU7fkDguOdkK4LYbOPSO/+NTtndrhZ+pbB+Wpx74+1LW2Wlihx+oZvW+gULyaaVBtFmpND4BzRV37Hp9zLtJyLAgMNJceE7KSasZG7T/VuIp7eIuIHJ3poxqQMhu06vHME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1DrCjMn; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1DrCjMn"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-8049bae1780so1077561a34.0
        for <linux-clk@vger.kernel.org>; Sun, 13 Sep 2026 14:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789334788; x=1789939588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CTYCoXrMCbgppF0VvjbFEflD3ptsCGeOgsPUI2PqnU=;
        b=D1DrCjMnVvpriQUII6dRnC0ouJihGTmt1oRvpYNMKzNxSSUhdlJe8JxUfh4eWEGtzQ
         tgFpkxvW7HfB7jQjQfS7DW6Tz2hi0IhkcupHQPyztmn27Y5YcO5UiTK/611wd/A9D3PK
         GLDaV6KqkC1PMPdo1DRphhLCgM3kjZTg1ZtZJw2bnQH/G4mQifc0LlE4CoTX36LzpoXb
         zi8UJd+4aQpJiJHQT612Vbfju2Zvkp6I3E5ZnFy09HIbfWZrTpLXfXirAzI/pZSQfu9a
         kEAGTE97Or6xETnQQIgzHDyRomd0GUwq30D/PsvSEWp5wPmzx4Zdh58CHUz2mlqcJXL0
         r7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334788; x=1789939588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CTYCoXrMCbgppF0VvjbFEflD3ptsCGeOgsPUI2PqnU=;
        b=TIJjW6PXSxkubhHDx0G1fyWmdTfNBhQp2DgM1SMoWTGvRFZ60TQ4xiN8+rOuSBasoY
         UzAFAGaXFbrDC3loPvVBzO3b6WJMgOjuGafEWK1NqYL98dqDZGm5zvHTMYmEqlaKFyDc
         dM60L1SaqIzGD3gxSTtK/zJ2KHZn/Sma/xi6qhfRfpp2wpudXscUXJqaBhA35dIqKJjH
         aC3ccY2bwBpY5Qxw1edG+sxiV8bpa6jGb/y0x9RXYYB/QdDK1s/cllS660AXetK8pWM5
         f+7beftePPykKfF0xG4SRYIAANeLwSu72/u6/C4GqyBy5FhdhczeVTxylTCPm3MnPiUm
         8+Ww==
X-Gm-Message-State: AFuF++lS6Amfl8wReEDkceaCG7AixtluRHQz7yWdLt3aDkNbL2tvWPKe
	iIPaBc05FmYfVEBDnLFqj+LqhqsuP0jti7wvE1M/8TP5/Tc+JjdkGcpG8uwnqNOhy0c=
X-Gm-Gg: AYBFou2g68MplOQ9i0jdz0QFhV/h2ezlY5cy4RT5PoAo26V8673veANgYTColtgSV0U
	+R5zkGEvbQunvSJE6zV7e426KrkL4ACMkj3hbkcyGreeiLmL3ek78TBurbiWsh8vaQUomG0svA1
	opjxzytsQ0XQQO7iMaMXhJiltuW875wmeWSCiAK9/ib0b1J7SW422Q12vC00Nh+f38XUCXk1LEa
	/RaftIfZQNHqo4HoV1u27NIhMeQE7e3jKbQH+R49pM5nRKjNLBiRtXr2OotGBgYi1uGrQz5auqo
	uoUvYrLBspi1V4JDUfhJx50G/PJ8NTuFIHFviO92y86k5mzlrXhr0eMe6UPXFrf/ZrJcqCWZ5z8
	vna7JTsEJ5l0c85ZNXHQn5yNWCNUhJFWkqK25uLDktYSN+p2KUseGtKK8SMmUsuCSxwFK0xKk44
	F4cwk2w5i+uC1IlM41kmPQel2IYIOilchyyNXAWHlABuQLjzkm8Lpq8U/+L8kzp1XmVb4ASxQII
	cmyvFF11Ws5tVvI
X-Received: by 2002:a05:6830:4989:b0:806:ab05:c1dd with SMTP id 46e09a7af769-806ab070e59mr3162930a34.4.1789334788390;
        Sun, 13 Sep 2026 14:26:28 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670eeccsm9165053a34.21.2026.09.13.14.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 14:26:27 -0700 (PDT)
Message-ID: <e657312e-5e2e-4f57-9718-31f13e622422@gmail.com>
Date: Sun, 13 Sep 2026 16:26:25 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt8173-mfgtop: do not use the clk API from
 power_on
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
References: <20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com>
 <20260912184456.1DB0D1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260912184456.1DB0D1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 1:44 PM, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Since this raw regmap write in clk_mt8173_mfgtop_power_on() in
> drivers/clk/mediatek/clk-mt8173-mfgtop.c directly asserts the gate in
> hardware, bypassing the Common Clock Framework (CCF) state tracking, the
> clock's enable_count remains 0.
>
> Because the mfg_26m clock is still fully registered via mfg_clks without the
> CLK_IGNORE_UNUSED flag, won't clk_disable_unused() forcibly disable this
> clock during late init?
>
> If a consumer has probed and powered on the domain before or during
> late_initcall_sync, clk_disable_unused() will check the hardware state, see
> that the bit is active while enable_count is 0, and turn it off by writing
> to set_ofs.
>
> This abruptly shuts off the internal power management clock while the genpd
> is still active, potentially leading to hardware hangs and failure of
> subsequent power-off operations.
Yep, that's a real gap. I'll add CLK_IGNORE_UNUSED to the mfg_26m gate. 
Thanks for catching this!
> [Severity: High]
> This raw regmap write in clk_mt8173_mfgtop_power_off() deasserts the gate
> directly, overriding any state assumed by CCF, which is part of the same
> framework bypass issue described above.
This shares the same fix as the first one; once CCF stops touching the 
gate, the raw set/clr writes from the callbacks are the only writers. 
I'll send out a v2.
