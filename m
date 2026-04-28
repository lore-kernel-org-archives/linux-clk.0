Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C85305047
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 20:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408709; cv=none; b=gO2AFJtGWkocLuEbOaJ3JLMvQDBXLWM4c4mESXJmaUMf3JaEECIfy2aHmYo3vB33PmSpV1GNqCGk2lLyHmfTPWHxw42NfEa8w4LXcj16XGWGsrNUFDtQg9CnMeQFkJyYsMQYPKWOGMZtFuPLN3zRJDw90kKh6sZ9nY0sR4AHyj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408709; c=relaxed/simple;
	bh=pDmse3ikNE1vwAD5KYJ0YIqBXCY+TX8S31byHNChdqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guvggolHL2x/c1m//jl3w3zCqEzz6FuFLRijviGQ5Sti+W/75OT3KayUEqUA3rPRpJlEXOujyss7WV4ubBvMJl4YZt9U2RMIDXf2cNObSLqz/U6y212JkYYXHEuWKU4RPDu2MZkPUYlWVdFcj2QpVuaaZEph4qTgdwrhzC0t8ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IF+tWKPT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=szyG72cs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IF+tWKPT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="szyG72cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777408707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
	b=IF+tWKPTp21nVd/IlYdml0wPUP/d+N7v5exjZAQrvjcdIsPY0fPasq4HdyBK9ImESoqdcJ
	90WUKJH7J5bFVqhaBGGTrQpPzcSww3dTpfD4Bc3ffGStXEotqTIb9Pm8+2lBY+OHpyKv0p
	mI+zQ9LKAOBGkSAnYUE8an6jcnWjhD0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-VuNz_WpdPlCBd-iPw0yIdQ-1; Tue, 28 Apr 2026 16:38:26 -0400
X-MC-Unique: VuNz_WpdPlCBd-iPw0yIdQ-1
X-Mimecast-MFC-AGG-ID: VuNz_WpdPlCBd-iPw0yIdQ_1777408705
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a275472d89so188287306d6.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 13:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777408705; x=1778013505; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
        b=szyG72cswFTsOg6Ct9RakI6QQVe7nBOwegp3Srp1tTypEzuingZKzMgCD6NexewKh2
         HOthfAY9Lv1wYDpSeRytx4mkxF0jk371K842UpxHvHTqWxsy9NzhPTtirkcUJKI/spf9
         pKP6l+0VAkGrlM7WjOnOU5DEAM6pM0R9aii4pINI0sgrxj88EwPY/7345CfTZMA7eQx6
         cpV1NeD8BMQ8HMKeDRB01SRZgWKrZfJm8Yki+NUBCYXU69gxOfc9IJLnEAz38bhRI9c0
         +4JICHyZwPIqaeoj8SgFB6NbnFBGz2i12QbmtIdu1qOMoUluMqcRGRndb9Ijvj08iQhF
         rECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408705; x=1778013505;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
        b=s3k7QNfHvVMiiMHZ3IdAnGUYf1W84Cg6DKvJhFVVtewqrFW5CoJs/KMCJAHwDjG1l1
         h8yV+AQViQZaWBebQc4fiSkR3CnJkB+JlnHDsesC7ap6kuOnfUf6DYbvYtf2uFXIE8Tx
         zMhrD/mkHmbvKBF/r6QXX4HKiFfDWi0oeMuyU+ur7qkn9Nk/ksCwCJCuIMOHoDundyxt
         Ob8WzbDkqo5PnHxqD6WYQzkz1bkhl7kcWZdOHS03wb3Qo7SpSlG/1McUgHAPOO0OD9dT
         f19+3PB9w5KOdlr2PIhCZKKiZI7diL6LJYTpohCKqLz3+GYeTPt6l7p+/Pv0TLURBDgY
         tAPQ==
X-Gm-Message-State: AOJu0YyFNxvP6xyToJxU470H/djkrk/8828104QI/9ioM/+AAsy7jmRb
	ZLigwVXHbhbef0XIO2lj+1Ljvsnf2C6Ft/1HpKYO/l15FI+UlpeSSA2c4hUhDbPW7dyEVbFNBgb
	fvFG7l2Ix0Bji7JuJsC8/pHxTbch6NQCVP0l0m/EwLynBh6PNpWEALr1odKRE2g==
X-Gm-Gg: AeBDies/gDylCinzGF8I5FFgMNiz2fbpRGM2xmSn3A4z4UFCecy2NZuCFghdG5/MQ7a
	IcAC7kP9mGkSItxQaWjpPriozV6n9stCM/ulWJmxkSbOPWAHs53/+auifIO3yStzQxzIGXmZL6h
	HNdpGHWMRMKtSgXFDNuQc5eu+HFt//5TkZ7aVNu23QIdIAAT3EEk33OMNobiYmDbpR+YMbP9QJl
	XLfDkVWmuhq44ZRjQsQ8oDpwHkcA/bSDQ1Wa7HIuZEEs814gL+o35rR+pJhIaKLsIbnk8ah+uoK
	HroefkcTvUCcuBlLfkZWOkUGhDcguMcZb83m2gFA1bgWW3CVL4e87qbuhL7vpX2ZBaPUnsAL83G
	NnRtmlPV/HXye7+CwBW8uH+cb9NHJmTQ=
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22408186d6.2.1777408705546;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22407456d6.2.1777408705068;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
Received: from redhat.com ([2600:382:8104:bdc6:d862:7b9c:1d01:62e0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7ef50fsm699056d6.32.2026.04.28.13.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:38:24 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:38:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
Message-ID: <afEau1Ny-7RTz4vc@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Stephen,

On Mon, Mar 09, 2026 at 10:38:39AM -0400, Brian Masney wrote:
> There are some clocks where the determine_rate clk op is just an empty
> function that returns 0. This can be either because the rounding is
> managed by the firmware, or the clock is capable of any rate. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Based on discussions with Stephen at Linux Plumbers Conference, he
> suggested adding a flag for this particular case. So let's add a new
> flag, and update the clk core so that the determine_rate() clk op is
> not required when this flag is set.
> 
> This series adds the flag, some kunit tests, and updates all of the
> relevant drivers under drivers/clk to use the new flag.
> 
> Once this is merged, and in Linus's tree, I can update the few remaining
> clk drivers that are outside of drivers/clk via those subsystems at a
> later time.
> 
> Merge Strategy
> --------------
> All of this needs to be directly merged by Stephen as one series into
> his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
> To reduce the noise, I am only CCing people on their respective drivers.
> 
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

We talked about this change at LPC in Tokyo, and you were the one that
suggested adding a new flag. I initially wanted to add a new shared noop
function to drivers/clk/clk.c. This series implements everything we
talked about in person. The only thing that we didn't talk about in
person was the name of this new flag.

Anyways, let me know if you are interested in this change, and if you
want any changes. If there's no changes then would it be possible to
pick this up?

Thanks,
Brian

