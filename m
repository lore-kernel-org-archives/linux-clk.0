Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185AC3F9F3A
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533370; cv=none; b=rqW5FMzJIQ+dJWskrdggs5c+tGI4Rs1f7hpRZv1hMdNTXAIbLIJyUfFEMZZqqTNEKTseuHIaKGk/2IodVVNRGlcTKrqXKP4+/eOIMSKJgzcu/IsKndKCHff7nRLtkvVf0ZvXcmRCD/MUUs89agzXhwRw3CUiqGivI2LTP4cQGYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533370; c=relaxed/simple;
	bh=ZQn8hPrkM36VCBIdCi3eFgK8VPUUP8gn25zK7fcuS7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+efyL4U1vaTHzIhfbvunSWuTvbIFoorOJ8CDextZqKXUoH4pqBNz+b+x2uVYmxO5xYPdHPKg14Lnjk89S1Ju4f9VcveF9Xf92aPpo4OekEJ8Zc18z2N3Sim7GB+OHWdFkjXwyoWblqWD1/e2JW+NPL1zsIlq/pZpubQ9QV7/hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAR9fCbw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kyk5KUQP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAR9fCbw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kyk5KUQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781533368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zuMhQAEiwW8EZyF1+ggYbLN42TmxHM1hwGejQcOObs=;
	b=XAR9fCbwD70YVZB1q45OBXXV0uKL2ebshcX1f3K5r98xisPocJ3dGl5+EhOdF572z3u2ZC
	7cwS0hM3qHVpKcNeDAlri/tNS8b28Gbs7zsjiaEGMCsTSZDDYGuAS2GJ25ZUjOdIpHoEZE
	co80HV0TBIDgYcf63wKWypKm5kbhoqs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-gLWrZJ3yNsaQmW4pcOjL1Q-1; Mon, 15 Jun 2026 10:22:41 -0400
X-MC-Unique: gLWrZJ3yNsaQmW4pcOjL1Q-1
X-Mimecast-MFC-AGG-ID: gLWrZJ3yNsaQmW4pcOjL1Q_1781533361
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156ceb551eso529335185a.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781533361; x=1782138161; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3zuMhQAEiwW8EZyF1+ggYbLN42TmxHM1hwGejQcOObs=;
        b=kyk5KUQPY6IiQqZqKBxJpnYeLi+ufrcDYW01yXtg0oVYtHKe/78MdlnaHhlDLeV+vr
         AuGKAYKwGF0K6KQ95Jy22FMAwxzHu1YGZUChseL7c+z+6eUuHZtz+NKeClqnxING6tMz
         LVrIOBEqZmKh0qm27iVgplLFx895CjspBGoD+EQZ2fZcTDqwjijRWeTDi+UKPG3iW/xL
         aq5iLE7V7GoKoFX75aqJiwhGLWOgej1vuBdUjIzfxlek37xhNLaCW5+ahhklvo+m+dJ2
         dMkreoclrGwnk2zn80pkYfszv7X3OCXipJEJDdY7hMQaP7nDN+7Cjy+k6t04CyX4x5D1
         pKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533361; x=1782138161;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zuMhQAEiwW8EZyF1+ggYbLN42TmxHM1hwGejQcOObs=;
        b=d1RXL8bTYenYs9EVg4M9LhXPgXTN5PanT9rpV/JkLTBQ1Lv8fqdmDXTVYfS3VZn/b4
         s5cpiT04YkcvKghOQecb4JXdZkBgZ3ZjB67vHPMN+9jNaHpMSqo3gzWWGCZRSZhz7M0x
         I2C1yitmZUxAqfqCfzeasQhDZHYk+ndf61cY9bQ4dAT630Zjm3pJLQex7yzqPaGqMSOA
         3QxUKNdYxJCi0Yil4onWqnzpezLvYrjSftkcLh597+0Xrqh7/c5yNyO92mkfkC4w2Rsy
         GSH6THlrFHF535tlvgTQRdIFq+tBN7xVvepivYs+g/iBNQoNUBUIKC+23gymZdsNX4L9
         e6Og==
X-Forwarded-Encrypted: i=1; AFNElJ9YL8B1vpA+uVucmHlufKiyXBDjqBjUbJtsnlMN1WUlR7nBWCL/03396kMXEewSGFM8UFStyw9QDcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YychADiBPpsbCADPlWcwrY+7n0rXaXjJ/IpBpa0rcw8+7r1TgFG
	gywYkWa7t9HkfKgOXN4KCSGBPUAwwkda/SEjXAS6bRzPeNZyz99ndolo8P6XmZN8K5ynvYZNz60
	qGQLqLRiF4N3xvI0h8pO2c9RGX7fAW0YjdT5bqAAHP2oYFq07JH4Roka/lNGgow==
X-Gm-Gg: Acq92OFWjFcxufzyJn7EJmqucHQGkM9MdXjx5yJhiKZUANj5o4j4FQ/nvhwYZmGAB7d
	4bVoDux1w8jxSKNTnEoLSyvqal+NZ+DlACMJDgKJxKA3GWS9f+M5StNvmCJBg2otTClVZtN7f3Z
	cXWP4vRWVQvEzxyrBz1Lu2tbrh9/tYQZzTzJvymTEX5d/0jLK6OtkikmfzMdxOBSgkY3mbeIvQ7
	93nXYBxgOAuUHYhJR8AJVvRNeeb3OMcbZaP5CYviiXB+z33Mp3ay1oGOPwWigfLj0dg3C32QzqK
	Jdc6dHCov/95e3YBsY1EOSt5UDH1AJXTNXYQ2dPAVPzzU2S2hYO43UbgvZtEDNxcoJsk4M1Cm+h
	ur2YYwcK6yUILFQqbDrJ3iZBRcWGdLrTnBRK61ZWhlimmlwQrS3hK4FAm
X-Received: by 2002:a05:620a:8906:b0:915:8c48:4975 with SMTP id af79cd13be357-9161bc8d76dmr2160614385a.34.1781533361158;
        Mon, 15 Jun 2026 07:22:41 -0700 (PDT)
X-Received: by 2002:a05:620a:8906:b0:915:8c48:4975 with SMTP id af79cd13be357-9161bc8d76dmr2160609685a.34.1781533360658;
        Mon, 15 Jun 2026 07:22:40 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006ef0sm1087098485a.24.2026.06.15.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:22:39 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:22:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
Message-ID: <ajAKrYK44-C9B9Yp@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
 <b732e65f-5963-4598-a341-06338044d90c@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b732e65f-5963-4598-a341-06338044d90c@oldschoolsolutions.biz>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Jens,

On Sat, Jun 06, 2026 at 08:25:45AM +0200, Jens Glathe wrote:
> On 03.06.26 16:21, Brian Masney wrote:
> > Convert all of the qcom clk drivers from icc_sync_state() to
> > qcom_cc_sync_state().
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> [...]
> > diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
> > index 0b40ed601f9a..0d920bd5a992 100644
> > --- a/drivers/clk/qcom/clk-cbf-8996.c
> > +++ b/drivers/clk/qcom/clk-cbf-8996.c
> > @@ -6,7 +6,6 @@
> >   #include <linux/clk.h>
> >   #include <linux/clk-provider.h>
> >   #include <linux/interconnect-clk.h>
> > -#include <linux/interconnect-provider.h>
> >   #include <linux/of.h>
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> > @@ -249,7 +248,7 @@ static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
> > 
> Hi Brian, thank you for the patch set. To successfully build there seems to
> be a header missing. I tested this in my tree on Thinkbook 16 G7 QOY and
> Ideapad Slim3x 15Q8X10 without adverse effects, looking good.
> 
> jglathe@tb16-jg:~$ sudo dmesg|grep "unused clocks"
> [    0.492547] clk: Disabling unused clocks not associated with a device
> [    1.178818] clk-rpmh 17500000.rsc:clock-controller: clk: Disabling unused
> clocks
> [    1.314479] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
> [    1.327608] tcsrcc-x1e80100 1fc0000.clock-controller: clk: Disabling
> unused clocks
> [    1.544869] qcom-qmp-combo-phy fdf000.phy: clk: Disabling unused clocks
> [    1.614767] qcom-qmp-usb-phy 88e5000.phy: clk: Disabling unused clocks
> [    1.616222] qcom-qmp-usb-phy 88e3000.phy: clk: Disabling unused clocks
> [    1.690273] qcom-qmp-combo-phy fd5000.phy: clk: Disabling unused clocks
> [    1.726354] qcom-qmp-pcie-phy 1bfc000.phy: clk: Disabling unused clocks
> [   10.956342] qcom-qmp-pcie-phy 1c0e000.phy: clk: Disabling unused clocks
> [   15.858926] q6prm-lpass-clock
> 6800000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling
> unused clocks
> [   15.867120] rx_macro 6ac0000.codec: clk: Disabling unused clocks
> [   15.867990] wsa_macro 6aa0000.codec: clk: Disabling unused clocks
> [   15.868589] va_macro 6d44000.codec: clk: Disabling unused clocks
> [   15.970465] wsa_macro 6b00000.codec: clk: Disabling unused clocks
> [   15.973614] tx_macro 6ae0000.codec: clk: Disabling unused clocks
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Thanks for testing. I'm going to put the Tested-by on patch 4 that actually
adds the sync_state support when I post the new version unless I hear
from you otherwise.

Brian

