Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A7743F091
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 21:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399154; cv=none; b=gkspfxqT1H67Cze0zPNd+wi38HnAT3mnkbbc2lndRa/G+ke2cjYs6ayQpfzP4I9bvr/MY8sFq3YnAOLmbEiBal33TaP58OH16V3E/OPXJKX1pUbgIzpJPedW18EREL+g3zsPE+/FLt4u6k8D5KXA3+10RlQyx00kMJ8YGdVB3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399154; c=relaxed/simple;
	bh=f8/4j/TRgSENYcqClLBb0UBt6QQ2qJIY3W8vGPNaE58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8z/f969wbk16AZvQ5P7k03rBp9BDQhK8F7+DFNu9NjccyJ8ziDIy0URvRhrmH7A2HgeQPJL+fGJ7q1ybCs11PIgoH/eKeBgWCAQXzOI2N3KP9fIIxDtGce2RAbJTlWVaQdxxZzz4d5e/GmXmfbWMI+jYWxm2HPUVPrVpbs2cMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bl7dmXXD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tq+FjGIW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bl7dmXXD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tq+FjGIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
	b=bl7dmXXDNIqzh4tsiNkrHgoDqJyCSktqe1f96EaquC7LTAde6HCnlFFpSyxdnXiQK1Kr89
	hUnSdGm69c0dHmwJ0tFVeFc8kw62BGEce64vzJ8Lh8b0unih9MavdtBecwBGQfAuY7buPG
	dvlfc7OWgRUbP7Ge5dTYFarHuq8InFM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-OcvbS7UiPneoqBgAD842kg-1; Mon, 10 Aug 2026 17:59:05 -0400
X-MC-Unique: OcvbS7UiPneoqBgAD842kg-1
X-Mimecast-MFC-AGG-ID: OcvbS7UiPneoqBgAD842kg_1786399145
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81ebb5e11caso70066917b3.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786399145; x=1787003945; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
        b=Tq+FjGIWGDfFsm8vyeschLnYgubRawdA3WZxzuVBXQqf6MXZ17mL0ZC6dhYNqxvAAY
         ujolijwuIUQOxvR91GabNE72rcqjdOSttznwdSenyjpl8t6/4xRXD7mZthvAZ1XDnqkL
         rArINGLSEGB/BvpVU1OJBZZ2taBZ6vMsNsQv5TOeECCLYoIeu2mxTW+rHmHFJiCoXzMF
         AzrgOL0uNKc3NtEsDzamnzdxYdUaXvcY7A+ta2VDtBOgLBW69RN+0NlZpLIRqdReR1HU
         8pEw/r0MRXJbX+syKCdJy6I6aSSoKQocuxScFbOibzexFVMWEN3uLNDNHqdFgOFaD2LM
         2Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399145; x=1787003945;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
        b=Py7RzZcX2NyZN6/ifO8CLGmeRkWLOCnSSoLQAWAflgDIQ74CC1O+kXpOfC6xQvfeQU
         +G2jsWLwZWh6hcSTwsymuHR6VCtH79lJHLdeaPfZ+e0qFJDM0YfXEBqL+psrfBZJTBu5
         EGHBLLOVYWE0ThlnQeHyw8yg3cMq6Yk+Z31d42+8w4nHCYxCebodfMrVsQEq7zh2JTkh
         w6WUYtGe1i1ZiWF2SYTlnhsBABQt2iznRkZnN2O/61Py3LTlP2fn65jZ+gFBze9gSlf/
         ekn2VLPEuVixk++s0SkX/UwYpoz+mwgwntg22HCxO1F1mIlEZMkRwBDK7hiUjuY3ZoPC
         oLXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0ytoS7R/odC9dJqipSo+ze4lFQlAlppG1QGF+z12ysiIEbZhAk6NUZiSOhLNVVooKdUcRggawYnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws8uLx7VRSSN/r0rFCkhxu1WBaDf5rjT2FUIOWVM4djh/quRwO
	LsEHcFtgVZraem1aWOgPGIi3V4o93VjCljovpULQGO7V/KXc0fz+IQdIhhGiDFONos2QWTQBO8R
	Nw/1fTH05JUgmEz9cQQPx4olEMNlZWX10O35BkThbrLH5iC1Aw998kb3XI7tqdA==
X-Gm-Gg: AR+sD11nS1TQkW95+yWIT+m7kkjY1gIk0n93RHE3L9lzwMfDrqjQbBa50pzuyOpViM4
	e3q7enCXkkrcDV+Xyy20EnzyruuyWzNHwSyq8zMT9JU/ShqhIIQwTKqLya0eVPT+wXxFpDz0pGP
	wjceGc635Aif4Ajg4DZl1EohK2HvYH09LFJ9nc7x4lt0GugL2DY0dX2wLxOP6JmuyjtXYwOHav1
	t/dNYxIECbV1MooHKUId/+fi0KkxtlxY7YOaLF6v28oJvYfcP7OMk2BbhpsQlWmNmj/E9T0gvkZ
	r/qtVCQT1lQ4qddUGld7REfpzBozhe04S7H7ZIY47OneS+oaqL9bJvMYi4epr1A78vs80EDY4rY
	SJkmienzUzvWuZhDtzL915g/ElYol6wrOF84=
X-Received: by 2002:a05:690e:128d:b0:667:b825:8543 with SMTP id 956f58d0204a3-66b12527c19mr2793243d50.49.1786399145037;
        Mon, 10 Aug 2026 14:59:05 -0700 (PDT)
X-Received: by 2002:a05:690e:128d:b0:667:b825:8543 with SMTP id 956f58d0204a3-66b12527c19mr2793223d50.49.1786399144641;
        Mon, 10 Aug 2026 14:59:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acae8584bsm7563368d50.10.2026.08.10.14.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:59:04 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:59:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Message-ID: <anpJpQgo--a43EdA@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-9-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-zx29clk-v10-9-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 10, 2026 at 12:28:28AM +0300, Stefan Dösinger wrote:
> This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
> Ethernet. The only non-clock, non-reset registers I have spotted here
> are hardware spinlocks.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

