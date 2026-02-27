Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118A623AE62
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210331; cv=none; b=THVY0h8ckszQ1l53/jcsQyjEqWAuQA/D8oNWc7f9ZSLt5tmcpF9JgyU3wKiGO7Qw/lQuWseRzL6SUtqxSH6gmFElVfOIz6XcqaV7yYKc4q3pd1b4qVCtz8XwKj9RjzwMEElIhOBAoY7HlIW56Wm3GXwuepdK6sVq+IXO5zmOREc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210331; c=relaxed/simple;
	bh=nR+w4zGkLQzjRTIc7kjY/q5/CbnV6sRdNO5FlWgP6N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/L/Xtl3mdI8SOMuiOOAgOATI5HGm3yIEy+q5rxigaUYn6bDpBMlHagss5Bx8ZJtefeAKWI+6xWcgYPHSk7XujToWgjQyTm/3FKpNbOQwU9s1QCiiyO29kMktlhfoV7LtCYPIDV9a/nTzQCzDv6+pxUtH0C8Os7vFltn42aYVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=faqXkrrx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SrXfSlS+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faqXkrrx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SrXfSlS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772210328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
	b=faqXkrrxX9jDebOGqPS4po+d59RE5auZS4BLM5bIDiAroSemkTkgOwuETJGDwDftOpubpk
	8Br+cI9O8i5FtY2BxMGZYywT3OUxeM2e00hE0buMYnzatoMLaGfWOR+K4u1JHtdetEbX3U
	X/pOeYi/ulTDWhbANC1pLtbQuS9zZ3k=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-m-d5V3SRPsylPYyogvO03g-1; Fri, 27 Feb 2026 11:38:47 -0500
X-MC-Unique: m-d5V3SRPsylPYyogvO03g-1
X-Mimecast-MFC-AGG-ID: m-d5V3SRPsylPYyogvO03g_1772210327
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899b12d76adso252225576d6.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772210326; x=1772815126; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=SrXfSlS+H0dalfq8l9T4Lj/ORePVPXj2NP2c0yYmqmAPH3AWVlwzZifxXgRHMHTgo5
         FFDRggYKjP2kp/bPhMOLKG9BqrYzyaKe7zoXcTgcKvWBx6VXg7+l9XwHPLksoolLeU2/
         PlylD5Wj4Ln/FIkA5GBQAATzVrK+382+eEpEZnMgIvtY/VkRkCKL4o3ZIhuAZUp17U8Y
         t6J3MQufJWHNq6uL56CvZ7n5Z68IUEFsCS3uthxke2WUfv0hhy81cc7uJoMAk20SVnKX
         6FUny2U8rFu8e7SMQ58W6fzSSUEn8pWAVPd83ZvVMlkpWUY4wUHHIUxmya8QvApqHy5d
         IQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210326; x=1772815126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=tIIPDPasrjJ7Iu6Q9hRAZpnFOEGkl8SwQFLsMFtT+BWXaKomITdGmusLon4garFSKI
         a7iWvw3WC52PgOm0GcHyguwHIwcnFtcD1mKR1vfmIbPbSgBjDdSNa73+h4T++f614kpo
         InPbmzKTgQLiVJNYOVrxeFpXfZwh1kOhJZnfTnQ/v1clwK92AP1OVmoiHlQk9imukL2r
         rc9PQEOvqnjG1p0c3v2v29kQjnobtQgf0Qg2VVHrGLos4UDVRe7A5ESbMoz4Sk5PKdvD
         RX0nclo4iyCSCP3gHqY+L9WjTf65xhkWFZ5VrR5pOAXagD4dwcVv7bQVLgSIu5v3WRvY
         FriA==
X-Gm-Message-State: AOJu0Yy0glz+uZ4PjJJUVa2n0MLodrl65VuLUBDuLlA4ThrjD0xLFzlq
	C6FylVXXYsxsiAXd1d65/lsPg/jv4phuvsKSM+5UCL1KFIeZj2zQMELYxx0ohponN6zuNn3GRkg
	RW9ql6ZoERq7fl2KFNQbdr2JILGuGuukL+wYzOuDSbQvbD1OkuINzffDcKdpKMA==
X-Gm-Gg: ATEYQzzKinEaP5Lnyk2yqWr5DeAZD4oJSupm1mo0KfZiBydK7g6ksgLVYRQxp12FW0D
	J5xsOj3YZaHhk2eo+yvzAx0RioGL1k66ZHBEiSX0maUV3sKECB63MD5qneXN+sOh/PS9/sJsfMr
	9RjQ7iPyebCtQUala2z7RFat0JWUUDLAjF+cCxN55e+bfk/SxasjDncujITTF50hJDtAsE3pRdo
	HevPYN8rRFXyx4G5rwK4kzfBKMzswrSgtGGvo31IvIZNiWeFPIQ8a/J7rVI04AOvv6GQBwO9Mwd
	jwaD4MIgpU9aDDr+1dJTyn0757ohGRT4KEgyleMfNecuE/zXKxGJ5ghrQz2z1W/YH/RngOKQcwD
	RGQHGqHBBvt0GUUWFXgwLRdz6vhmmyhztWSKBErMPYFyMN/K1SgAzvLDI
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49660266d6.8.1772210326398;
        Fri, 27 Feb 2026 08:38:46 -0800 (PST)
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49659456d6.8.1772210325713;
        Fri, 27 Feb 2026 08:38:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50751256df4sm24041401cf.16.2026.02.27.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:38:44 -0800 (PST)
Date: Fri, 27 Feb 2026 11:38:42 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaHIkpuK7AFXbeM-@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Feb 26, 2026 at 01:16:45PM -0500, Brian Masney wrote:
> There are some clocks where the rounding is managed by the hardware, and
> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
...
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..187f8248a9c840c701cbbba99bb7cdeef7b654ee 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,8 @@
>  #define CLK_OPS_PARENT_ENABLE	BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT	BIT(13)
> +/* clock rate rounding is managed by firmware, don't require determine_rate */
> +#define CLK_ROUNDING_FW_MANAGED		BIT(14)

Based on a conversation in the Renesas driver change, I think we should
rename this flag to CLK_ROUNDING_NOOP. Let me know if there are any
objections, or suggestions for a better name. I'll let let this sit out
there for about a week or so before sending a v2.

Brian

