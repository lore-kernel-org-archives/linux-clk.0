Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16F7335544
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766424210; cv=none; b=tKN3bWHXb7pmB29qR+blBNhMU2djjXMkcWFbXKRWOS3i7ayyyhFVZL39xQEdalMmK2HBhLQnPokzaTwjIMts4yf9v6YLiIqJW4+uj62CAOXF3+gDZkjG4NzOL6huxzvLVtgjNe4LhYoggIuke4fVD5TLg9APV8Kw1yztxJVB8dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766424210; c=relaxed/simple;
	bh=GQTHFo4whASER3wNoZEyS+RBjHmvHrV/uHkCI7f7eaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGetbFu9OHtJLQ1KkB5Mh1wfnyfwbcVx8WO8pn5CYZT5pUGkvVh7po5zHySLwY71aMDvr32K6v0/j7aeqPSaq4uMWsuOy9DRA/g5z1Qoz0UPDuKKKeSJ582JrfNMyr40zMJ7XxDW6eHwt51hyGjceyY54JMj99TVpZgkG18W+dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fBAQUlkb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGBGUezf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fBAQUlkb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGBGUezf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766424203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwEstf6r6WGSFcl4NQjmQ4rhiYAcOfeicdaQ/CalBkk=;
	b=fBAQUlkbLWaLQ8bn96o+mAPwbhAee0vYsPeOYSFF5XI18LDh9GdjCWGcCDXlDDuU4cqMKk
	gVCvK3/8gO+Wgf7mxxBkaqUr/RgynY7ZJvmRNvwjW5bHttsEWovGhG7J6EqoZLHUYddxvj
	6mRlOnyXP9ygh2fYjjRH/RoeVs7ZIfU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-FywzX-WsNJevfqkMtgfkNQ-1; Mon, 22 Dec 2025 12:23:22 -0500
X-MC-Unique: FywzX-WsNJevfqkMtgfkNQ-1
X-Mimecast-MFC-AGG-ID: FywzX-WsNJevfqkMtgfkNQ_1766424202
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0995fa85so119883311cf.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 09:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766424202; x=1767029002; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OwEstf6r6WGSFcl4NQjmQ4rhiYAcOfeicdaQ/CalBkk=;
        b=IGBGUezfjQj/NP+KJyoohTjOWsBxnJHEjgPW3ZpauFIUoIq7MSs1DnY14DTUXKPKMB
         tfw3Z1+blfW4Sir4XodefX/ClvcoCfxqjelYTY55Ld2ONJjBCXfHoRjKxwaocjCu8fyS
         YmXUghdPMEJdXfY/0ddRs60Avlq/ikH81mQ/fQomCq7Lmf7edHb9C1x8QH7j5Sugp5IR
         U2vwPj5ST8dncjaQeChKXslHzt49BlGteBwv2AAcF/8mfOkLj5jin7CMPLyW2Osdl3us
         9K3ILWFm8JMYDt/UoBIuNLIZ2Nv+PHynI85NDoYMNEHA7wAgKQlwPA7qI5HV1EB9YZv6
         BpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766424202; x=1767029002;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwEstf6r6WGSFcl4NQjmQ4rhiYAcOfeicdaQ/CalBkk=;
        b=JFuFzG3rtIBDE8MgH/lpmJNFJuOYLP0vECFM+hPxK0fl5yhLRnwlf5j13HUrmROFx0
         veMmV2VxuEj50og1tOFGM6q4KAXYoWmb+u7YvQ3g3mpr3n9E96y9YZ+Os2IxbzvknQvN
         KGPaIPiijXM0AMlm+RPaopKoieobX5cWtcR5axj/jP96/xfXSdRIg8uhVT/muJPGISYX
         02OhfC26hYbvUoeqwVpyB1HXB+1RTC/UwUMbH/j6huLOgikmKY7Vfaoz2vUEUqTYoj43
         grl8x4d89P8PXAoFU2TBeJcoxG8mZ1JazGsKSlyqpcMEFNhZK1yl487N+tWtuiwjhyp4
         Uttw==
X-Forwarded-Encrypted: i=1; AJvYcCUf8HAntYWAiq5/cNg76X6troGAn+ovQ0GewJcicPVuSj4JutHlivfgUhO6qvDPG+Pc2ivbbcf3fso=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIYdntW5pb/eNgReYheg2+Yc/DpAfYxQE+SIau7IWpBt0ca224
	CfxCYNu05Au/Qlifw//ytwhTiE7RLTSAdb/rhWc+viMqgFGTd/HYXzWN4MHmnxFFCUeIX8+nEbt
	wdIUSVAn6crBz3D50V5kzh1PBN3tNkjF6OPOGNKdf3Xd7Jp9L6TrppmzzWvl9mw==
X-Gm-Gg: AY/fxX6xEs5pqzo1Jxp8Kh7632FWLhR3QSP3PM5Gxdinl5fqWlKuuGhjsxvBmqaMXXA
	sNkt+4Kjb9Jxf+g2ga40oMWdmuCZWfPN6wCEZQEXcXtfUzTIHclv0NONaOpralGIeaL1Q3n85R5
	TXCmqrjwQye43a0v3OA1mpox5sBk3TJI/YgJv7F1DILOGNef1054+JJg0O7U9wuMfuOkt4gWwfL
	nDaWeujNfBBo3yPz6FWfIOsLRFjXV1NgS+a2Yp8MGqV8zLbEBGdiQ/itcel7tk5gfNPAO/LDauJ
	hkNwSY36AFw5Uny+Z2UEQKEtO503sWQBLChvXX8/SpO318EPNouNNcMp92HuH1Vz7lu4fwco5er
	QmZaY55WNbGcjs89zCDtrWi4p80cD7+yQFk8K9Y/uV+p+
X-Received: by 2002:a05:622a:1e9b:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-4f4abda14camr182131731cf.64.1766424201880;
        Mon, 22 Dec 2025 09:23:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoMgPPIQsV1pXs3csAAdaxSFCnV74n1koavWrq+0eJFhGdzK743D1tBhI3LJTkIpX69mlpuw==
X-Received: by 2002:a05:622a:1e9b:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-4f4abda14camr182131371cf.64.1766424201509;
        Mon, 22 Dec 2025 09:23:21 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4b6760a43sm64680431cf.22.2025.12.22.09.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:23:20 -0800 (PST)
Date: Mon, 22 Dec 2025 12:23:18 -0500
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	David Gow <davidgow@google.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2] clk: Disable KUNIT_UML_PCI
Message-ID: <aUl-hngUuG3FWsR7@redhat.com>
References: <20251222-clk-v2-v2-1-83e1a5ed8c7e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-clk-v2-v2-1-83e1a5ed8c7e@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Peng,

On Mon, Dec 22, 2025 at 03:06:33PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> commit 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
> enables KUNIT_UML_PCI, but clk driver could not work with it.
> Deselect KUNIT_UML_PCI to avoid the failure. Dump as below:
> WARNING: CPU: 0 PID: 227 at lib/logic_iomem.c:141 __raw_readl+0xac/0xe0
> CPU: 0 UID: 0 PID: 227 Comm: kunit_try_catch Tainted: G
> Tainted: [N]=TEST
> Stack:
>  a0883d00 00000001 00000000 ffffff00
>  603ef142 60044832 6002598b 00000000
>  00000000 600211b3 00000001 00000000
> Call Trace:
>  [<6032534c>] ? __raw_readl+0xac/0xe0
>  [<60044832>] ? dump_stack_lvl+0x57/0x73
>  [<6002598b>] ? _printk+0x0/0x61
>  [<600211b3>] ? __warn.cold+0x61/0xeb
>  [<600212cc>] ? warn_slowpath_fmt+0x8f/0x9c
>  [<6002123d>] ? warn_slowpath_fmt+0x0/0x9c
>  [<6032534c>] ? __raw_readl+0xac/0xe0
>  [<6002123d>] ? warn_slowpath_fmt+0x0/0x9c
>  [<6029e2ad>] ? clk_gate_endisable+0xcd/0x110
>  [<6029e315>] ? clk_gate_enable+0x15/0x20
>  [<6028795e>] ? clk_core_enable+0x6e/0xf0
>  [<60289f1f>] ? clk_enable+0x4f/0xa0
>  [<602a06af>] ? clk_gate_test_enable+0xbf/0x360
>  [<60053df9>] ? os_nsecs+0x29/0x40
>  [<600cd300>] ? ktime_get_ts64+0x0/0x130
>  [<600816c0>] ? to_kthread+0x0/0x50
>  [<602507bb>] ? kunit_try_run_case+0x7b/0x100
>  [<600816c0>] ? to_kthread+0x0/0x50
>  [<60252aa0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
>  [<60252ab2>] ? kunit_generic_run_threadfn_adapter+0x12/0x30
>  [<60082091>] ? kthread+0xf1/0x270
>  [<60047591>] ? new_thread_handler+0x41/0x60
> ---[ end trace 0000000000000000 ]---
> 
> Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Drop fixes tag
> - Add R-b
> - Remove "CONFIG_UML_PCI_OVER_VIRTIO=n"
> ---
>  drivers/clk/.kunitconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
> index 08e26137f3d9..8a0ea41934a2 100644
> --- a/drivers/clk/.kunitconfig
> +++ b/drivers/clk/.kunitconfig
> @@ -1,4 +1,5 @@
>  CONFIG_KUNIT=y
> +CONFIG_KUNIT_UML_PCI=n
>  CONFIG_OF=y
>  CONFIG_OF_OVERLAY=y
>  CONFIG_COMMON_CLK=y
> @@ -6,4 +7,3 @@ CONFIG_CLK_KUNIT_TEST=y
>  CONFIG_CLK_FIXED_RATE_KUNIT_TEST=y
>  CONFIG_CLK_GATE_KUNIT_TEST=y
>  CONFIG_CLK_FD_KUNIT_TEST=y
> -CONFIG_UML_PCI_OVER_VIRTIO=n

I talked to Stephen at Linux Plumbers 1.5 weeks ago about this
particular issue. My recollection is that he felt that that the issue
ultimately should be fixed in UML / kunit. I'm not entirely sure how
to do that though. He said that the tests run properly when you run
them natively on arm64.

If I was going to take a stab at this, personally I would stub out
the writel as described at 
Documentation/dev-tools/kunit/api/functionredirection.rst.

So, add a KUNIT_STATIC_STUB_REDIRECT to clk_gate_readl() and
clk_gate_writel() in drivers/clk/clk-gate.c. The clk gate tests can
then provide their own mock readl/writel.

I don't know if that'll get accepted.

Brian

