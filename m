Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E0D4A3F1C
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002379; cv=none; b=Qh/dOcJazBn+OtZPmHGUvVMDXAF0warQWJx6IxhZQlAmbx4FCIw8UB2LMZahLdMjVf/h/b+voorfFqTulOhpzjgfZeYF69Xfyc2cWNU6KhL9LLjSyPJPEyzv0qdeu3bHdJxXHjLzD8NHD12zL6jy9tgou2Ymn0o6vtbn6gogrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002379; c=relaxed/simple;
	bh=g+1M4HqjEzjilBm0PxJObiEwb0aU1IwrI5Gz76d/G8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOHXL3bxtOerKJy1CSWrrTeLMSKffTFc0XXnpRBTAlFHFtEKdeAddMTfrhsQJzBah85Dlhz4+k32zOGCsV4ksMmucJ0quT/85AHYcT7J35pGSYv+fhm7eg9x1SieRLoQVn+lp2gKPca/VARpdsg/I/YrMDRRYsRWOI88WomkR5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gh0BXbgz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dduVtyj1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gh0BXbgz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dduVtyj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790002376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dte/ClAGy6eKCFKXrlyXY7UwAZkdvgemrmCIbNf+44s=;
	b=gh0BXbgzWZPvJncVpJuBBnLRSj7OrhVokjLzG123jgu2TcOLz9nFBdRl2ddoWd3k1NdrD7
	PWkmwj84B3DH/56HyrPG5NkVhlKat0QG5hAivoDpIcxSJz9T3a4g/+4IOcxP4lenV8cqlS
	u8+SzkN1rKHKE0JKF84zEcJrW4ngUsg=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-81e_kD-oPcePFgKOb4Khcw-1; Mon, 21 Sep 2026 10:52:53 -0400
X-MC-Unique: 81e_kD-oPcePFgKOb4Khcw-1
X-Mimecast-MFC-AGG-ID: 81e_kD-oPcePFgKOb4Khcw_1790002372
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78a58df134aso845076137.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790002372; x=1790607172; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dte/ClAGy6eKCFKXrlyXY7UwAZkdvgemrmCIbNf+44s=;
        b=dduVtyj1zqWEiWMCwj2fHNNL/xygHFc6MZkhiDoLxNLAzVGRbappJBnX1DfitQuOUo
         fWnGB2nbBN8DiORc6/hZLFxSNKoLBmsZ4wo6fzjkYKq5nmhfNA/tFIuvPvBTZwrb0tCl
         ya7QBcfgvmybgnfhoJZPyuaChDZYR8lLUGw3ephlzYCXRM+izFuOSKUnqEC6VPF7yoVJ
         KC3MgRYiKUYORNpZcICnfAfwmvnqRSRHkrG3zDGJuKnQkxMRh6OXftZCiyYwCsXk53uB
         cF/sAmvU5sZQtCjHb1wVwBE8z2G9NETzpAOA0EMMy/nsKhfQx90Im7f/0G11JUQWeKU/
         jgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002372; x=1790607172;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dte/ClAGy6eKCFKXrlyXY7UwAZkdvgemrmCIbNf+44s=;
        b=1HBJifwo35Gtk0YCNwzQOVfZcNCmctRc87zG8aOyXh71WuQCBt9WKYljubob20ZoQ4
         A++WD8GMnVf8kr23Ag1gj0rq+Q1fbwM8YmGMRmF4jDnRjQepn40j+GrQebfM+Gw86/uM
         xRBTIiI3bdlntBjQHYV8luW5asVoQHZ/poXqzg8hzmWWrzg7+zfCmHXzpUAn/bZiZUsm
         heHuuEP+jBo+eEDfbnfk2qAx0tDwzz/runhZe4z3xrsVVwBXWVJUrzAQC2Oo4GvgYfuI
         6XC2BNbPWGJ3djx/xn1QMI8FEmIuKgXMj83HsR3gOlmx4NQwUMqzSl7q2p6r70LWgv3B
         8A6g==
X-Forwarded-Encrypted: i=1; AKwUvByLZN0PZ2rmhTSR+1wrzxxKcnMBTvOgz/IvUOnOVUaQYx0yPcdfne3buaYvV/qkJyHckX5+MuS+B9w=@vger.kernel.org
X-Gm-Message-State: AFuF++nOUXQTCQ5ysyZpWksThcAQh7T96cxJBh6qQWIaqWJ+V6QW4tME
	zzIqwsJGcupCjMo2vxecZIJ4ksHpl07SLkCVy/HqvJCYx9FK2M5/ZQr7N1pI/BnmhROePl8Pv70
	hMXYRpw0U2Ml4UEG0YitCRKMAk/x0UzgXiG+5fwTnZ/vXr/zDMsUeQBdAdgRELg==
X-Gm-Gg: AYBFou0GVUNKQyQVdDjxm+sQO5Mztxh5cPjrcf5iJaO4DrEk/cHEIRNSWMaN8J4Xl5Y
	T32QWMdxtMsL7y7BmB/dSt7lSiXmbvSZsaFbzb2CBX+NjUImvRWVChs+Cv73+neeErS0GctN3PE
	gYOQzHoNZR5XPRh5bxAwGCoJzpGuQMpnsPCxVFkhXO+kCftRUvwidrUsijMfrnQy7ZJ0o/C/UG9
	taojGqveRfPWp6NLnkRgRmmNy+Xo3qqTGb5vojc5Kgfn7/FU+UZk+z3dlhi5Vxj6Vc+zH1GE/MC
	Opc1eiMg9fxVNrykwOCZcXupY3/OibJoqyt0H/otnkdNH6IqdG65MWorM4A7nGNg3hLbLf5lSto
	3QlIq+Eai+/8M0NznNosPqSPpAobHxZEjo80=
X-Received: by 2002:a05:6102:e09:b0:7a1:f7d2:e807 with SMTP id ada2fe7eead31-7a55c0748b9mr4687567137.15.1790002372213;
        Mon, 21 Sep 2026 07:52:52 -0700 (PDT)
X-Received: by 2002:a05:6102:e09:b0:7a1:f7d2:e807 with SMTP id ada2fe7eead31-7a55c0748b9mr4687509137.15.1790002371483;
        Mon, 21 Sep 2026 07:52:51 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a3097dsm69888436d6.8.2026.09.21.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:52:50 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:52:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
Message-ID: <arFEwdu6EucK1G9x@redhat.com>
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
 <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
 <aq2-Ysy2wbLeBWd1@redhat.com>
 <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

+ Bartosz

Hi Adrian,

On Mon, Sep 21, 2026 at 11:17:13AM +0800, Ng, Adrian Ho Yin wrote:
> subsys_initcall() / subsys_platform_driver() would not fix the failure we
> are hitting. Both still run after time_init(), while the DW APB timer is
> registered via TIMER_OF_DECLARE from timer_probe().
> 
> So moving from core_initcall() to subsys_initcall() changes nothing for
> this consumer: the timer cannot defer, clk_get() still fails, and the timer
> is never brought up. That is why these patches use CLK_OF_DECLARE(): the
> provider must be registered from of_clk_init() so clocks exist before
> TIMER_OF_DECLARE runs.
> 
> On the broader point about CLK_OF_DECLARE abuse: I agree it should not be
> used merely to beat platform device probe. If the preferred approach is to
> keep the clkmgr as a platform driver (subsys_platform_driver()) and give the
> DW APB timer nodes a fixed clock-frequency instead of a clocks phandle, I
> can respin that way. Please let me know which you prefer.

I wanted confirmation that you wanted to use CLK_OF_DECLARE() for the
system timers.

Will you by chance be at Linux Plumbers Conference in two weeks? Bartosz
is leading a discussion about the future of CLK_OF_DECLARE() and
friends.

https://lpc.events/event/20/contributions/2503/

We want to minimize the use of CLK_OF_DECLARE(), so the preference is
to keep this as a platform driver if possible. If you are able to get
around using CLK_OF_DECLARE() by initially running the system timers
with a fixed frequency then I think that would be preferable.

Brian

