Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF7C3A641F
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 17:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358466; cv=none; b=rg828Uu9feCUdSnyQAvv2QNKXO6oNBIz2uwIFedPYHsihnJlWxBB6397qcpmPyOj1I1lmGQhMusL073aKufBUhW2j0Ypq7tTwjvfuj4esYyrCGFt1u0/gIgvyAJw/47zMVIcIkS+S1Yg34OSFZVMxIAspUrH0yQl042fW9On7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358466; c=relaxed/simple;
	bh=1gH8j5okrpqIA0iLWhjcokSK0dlKOpJ+lgKuf6n1R68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K200mELxkUZbxCKia3XUdv2e+NG/8F/aUhYjZ6/q6QbxRADLTMAHRlwFxzuZZecdFTrNB4/NCPXym2qoSOFIO0fkhKXtzBq152NwInygPKwCQYXgsrqJV4E5Cdyp608rMTtVOynL02Cppe53IEni2SJty/6B4RGRILOzylI2g1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vz8Srcku; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Et9E80DV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vz8Srcku";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Et9E80DV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783358463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LcdPITzALTLRlqq4s+4MTvnfbA8hSOqu2xInA+fGf3o=;
	b=Vz8SrckuOci/3VJ+nvLfqmvrkS195RZVfTb7T2WK8GysPBP3BYw3H28s2ruF6ZhmYZhsEs
	LjWG7u8n+78Saxqp365wiLPdA9ah4HOLB44l3fifmk2ToFMd/qjXnOUnPjK4OGG/INYgK1
	CcoXHZefwKuGfdaX6ypGhNdA5sLYlR4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-kOZJiV92M-auc7Th4k4_XA-1; Mon, 06 Jul 2026 13:21:02 -0400
X-MC-Unique: kOZJiV92M-auc7Th4k4_XA-1
X-Mimecast-MFC-AGG-ID: kOZJiV92M-auc7Th4k4_XA_1783358461
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e73fc29bfso469490185a.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783358461; x=1783963261; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcdPITzALTLRlqq4s+4MTvnfbA8hSOqu2xInA+fGf3o=;
        b=Et9E80DVsCnltKRDOeZt8rg86gGpGdmHz4p4mmDUpphaMw2Nqmo6yO1piY1KZWmmPQ
         AFfX+ba/CsHPIzBEGue9e4cFW8Itw4R/zkTmISDPVG2BmXrMBLt0oBjH6rm5LI/06rAQ
         RAU2uBkfqgU2bxTTgMzmI/K0ZvyNqLZiiNiO1e07fg0kGWfnZ4+oh3cXnc4bOxdSwoEq
         qXZl6LXgpb/kmlZpftNw3gL3riltWIrWxaEOhVaYBoTtuPaBVIB9YL5Y7Vi/5uD0DVJe
         9dudi/KxZTF+iwNW9UXFrAs1TsbqE384FUpTbKEXp6BUVU0ukWciUK0XN3vn6Ufol0pp
         bDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358461; x=1783963261;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LcdPITzALTLRlqq4s+4MTvnfbA8hSOqu2xInA+fGf3o=;
        b=cLXxaDtzjT9uBAXnyyA5qPnuXUWKWEjYsH0uK6Fqkjcip2tjb7jJn4QWsXzRvcFLH9
         Ho+Ca3rFO3DqNtIL42oDRBu8cao8AvR4iNiA5Zpb2x4vrvtTine6KtaYecT0b1wSgSD1
         ROB4jcUnisNtpoPbo8rDvxeyGoZTTQOTVXOP05ka7rJWWofYgMlrZWAG0SFBGKJhU8RI
         oS4qIOhxB3eK6EvOkYgormYVIeUeXsBIIgUFr9Rh0a63ih3AgUbsliC2wmJklqtoczfv
         4TyAeRhcBdjORXI9TG+GRTUpkHaSJAaUC7+EqxPHVGif9IC47ImfWWFtSK/Awhgy7aEk
         GPWg==
X-Gm-Message-State: AOJu0YzGCjoO6wJb5k2d6Ic4e1lU98ZsSFAmetj/e1gHP7cFXz6phAkT
	5wARKj4KujfMN3HeotDxi9Gb3mgsV8lde/CGuGbwBzHYaq5h1eVJWgRW3t3CxyGz6eNnijqTRiP
	ov5IzHt6D35XqGbFftVvuFUHvxuP5OLjpw589AUGGYxP89kNsIUGF/bZ6wxtn9WJud2UgiQ==
X-Gm-Gg: AfdE7cmWzWyCi/VT3gyC/wk3tMszVs7k8BACGtlfpmPx+EgnoRoJzBnxTcrsakHlNEw
	c68G7PUH1FKnUpPXxCGoarmBpWXZKIWAB7yGMPIJDnbDgZfLcTx002Zn12WqJf2pt8JmemsGihN
	njS1khPYpRJLsW8BUIsWwmt6vgrvbgk46C0BJJj5N39DWWY72288/P/AvqT5UqFkLB4mpZdN7Yb
	AnvOcf5RLL37WylEd64ASeARPdyAUPSdGOXwc2YNG61zaLUGZ9/6THgkcMG/xcXJnW+EkOSGi0I
	47WoXJGVkAgRLwAmzh7RJdFheDqYyGAVd7+TVaQzYr3b9D2O+8VilcaUNPeIHstBPD54syg+0s2
	9K/Tx6OjUvDwqgJVi5P8nHi1zSl/dB0Gl1ePTMS17WCLt+g==
X-Received: by 2002:a05:620a:31a3:b0:92e:5b92:98bb with SMTP id af79cd13be357-92ebb4b571dmr216557785a.14.1783358461600;
        Mon, 06 Jul 2026 10:21:01 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:92e:5b92:98bb with SMTP id af79cd13be357-92ebb4b571dmr216552185a.14.1783358461159;
        Mon, 06 Jul 2026 10:21:01 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ccde4fsm991108485a.39.2026.07.06.10.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:20:58 -0700 (PDT)
Date: Mon, 6 Jul 2026 13:20:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: thead: allow COMPILE_TEST builds
Message-ID: <akvj9WXsHJw5-n2p@redhat.com>
References: <20260629032814.2344879-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629032814.2344879-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Rosen,

On Sun, Jun 28, 2026 at 08:28:14PM -0700, Rosen Penev wrote:
> CLK_THEAD_TH1520_AP already allows COMPILE_TEST, but the parent clock
> Makefile only descends into drivers/clk/thead for ARCH_THEAD.  Use the
> TH1520 AP clock symbol for the directory gate instead.
> 
> This lets the driver build on other 64-bit architectures selected for
> compile testing without selecting the T-HEAD platform.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/thead/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 68145ad91035..d651e4ed3462 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -157,7 +157,7 @@ obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
>  obj-y					+= sunxi-ng/
>  obj-$(CONFIG_CLK_TEGRA)			+= tegra/
>  obj-y					+= tenstorrent/
> -obj-$(CONFIG_ARCH_THEAD)		+= thead/
> +obj-$(CONFIG_CLK_THEAD_TH1520_AP)	+= thead/

Right now, CLK_THEAD_TH1520_AP is the only Kconfig defined in the thead
subdirectory. What about when/if someone adds a second Kconfig, and
that's the only one that's enabled?

Would it be better to have this as obj-y?

Brian

