Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57440357D0D
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 21:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787087646; cv=none; b=YYuQawMwOG6HFjy3DVd4hnpicq2LkJ5j7ZwiGa2oJelG5092Ffy26eaHdR1zr2ksx/5L9KYDs5fBeRA7sXEBaEWchUEyqNPmsWuOtcvh2Z9oDa87fts8SOkT8Wyn30lQ4VMCL4QS+R2Rr5C6pK8+HlTO9EM9x4QVRF33bsjtevM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787087646; c=relaxed/simple;
	bh=6ohOiM74UD4xMxkO4OFu7OuzhXuuv8SHaskdv78UhzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZciKhLr2wZg1029P1iYBL2auYFaV5VlKZySCgNw65l6YXHStuHh1IvMlCki/za1U0ojTXknu56T4U5Sw82FSHj1JthogixVcI6c6LhBTiUop20rmaOSifMd4mSIBXflWcS/fIIK51FbHFiOD+LjbDFCD/KQP3kqjqX+2K7kVZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZIRdSTGX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZfXKyppD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZIRdSTGX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZfXKyppD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787087643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F0M1lc1PhRG1akNgGaC7ljiaI/Sk2ScYO5cf2onL4Tw=;
	b=ZIRdSTGXzWYE5KonAi/weK1G+mQAXVfSyHQQmTUpVYstQvk2lK7I4vKcFLO2Jv+EERC/1O
	9l0qXcxRFFhEcz/MfulOq4pW6bWnmV7mxuB4WmJIeFdvn9n+Whk8uWYtrXa5qWsXaCgQ/S
	amyoDqdNUJ9XWuS7ffyJ3rc4LPyj1qU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-Svl5FHGKMpSPfYIxr-3hHg-1; Tue, 18 Aug 2026 17:14:01 -0400
X-MC-Unique: Svl5FHGKMpSPfYIxr-3hHg-1
X-Mimecast-MFC-AGG-ID: Svl5FHGKMpSPfYIxr-3hHg_1787087641
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eec6acbe21so6819146d6.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 14:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787087641; x=1787692441; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F0M1lc1PhRG1akNgGaC7ljiaI/Sk2ScYO5cf2onL4Tw=;
        b=ZfXKyppDdjSxU/R/AKqn21yaoi52+aVXvoEX3AAnqGZLzy/jq+NEHRGmB+KBzV0yWw
         upARMsBFLkEMckjexi7L5qGra5LeARNc23vzbZUiAZSgQu9/GCSJnDBo2nDEP55qLZDD
         QZRY8gEUqdRblJ4QimfoAFOcop9Qh1iTgCjDXzMcgYIsXOiMOg0yCdfyvef80FugDnfb
         SHgsgIZ8on4zmOjNXTgZ+6lhq5fjFvv1KOWfJxindhFUQYQm8SuIP0E9Yd+qEUgiv/Ds
         ykD725AoWvD3/Ivaibsh60IpQA3647wo3Pa9YwLUZKD2sh2bFg3oNqcx3L+j019pqD6J
         92oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787087641; x=1787692441;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0M1lc1PhRG1akNgGaC7ljiaI/Sk2ScYO5cf2onL4Tw=;
        b=hGHF/iNDboTgFzwQE9yOMvMpBPu6aC9tJSe22+rAa4MucbcRSG7okgjvkC7fw/Nerq
         wJuZgiV9cMdoG5Dc4OG8DLrx6fjc0BBmzfgsNXFckArCuopHaThUdDwWtzZGiVD9UDiV
         aeS5MdElbfWq0XxRap7tCW4mevZmswjcGpH1/H2tk/MZhPbhZ7yRXzF2j/HK32CGe0lq
         EDaT1Khmb8YY07eQW/uYbmE81oHnrxotJLt9ofkHxk4NpxQv2Nstdb24lfuKOMRaNjI0
         rfcyZYCAh+uJy+KLvOuPrzE7fL5ySAasnAw2kZ+Hw9R1uxuV3iJogQ3vWTVQhd0RCL/F
         33NQ==
X-Forwarded-Encrypted: i=1; AHgh+RofZrtAnY8jPGTcxxEnLGJjIP23b1T+BuVJAaJLA5BW7KV4JouBYOfy83RLx8XV5YOsY55j69yoRUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNix0/SUi6l605YgCQGj2BkUVuNencc1OttMD1N6xBIvNKgDgX
	SCpZTDma89eTRhffPFxZe9dO/Cs7y/pQtyrYUo7tVzmd9IqsfE2mYZpGYB6eKVAFgArlwMaVgvP
	hOx8LKMre/LKHsMG6ZxekTwafwaa/FEo9Gel3flj2eUZ1DC2H4R9jTH3YhXhqbQ==
X-Gm-Gg: AR+sD13mM3uIG986AgD3400KrSyO/pqmdL8uZd5uCrRXWsvKwdBAreFDf1cNC9lzT3i
	QDIZN1Ci1T9Db0RQPKVZt6FRMmqH69UUrO2pNNma5I/l1SrJA7XGHWKBh3PPNPAqmnedZTRTCkl
	zkmKVtAEg2DaaNODEeOQQcPNpYOTQctV8R/zDvOmsxIggX6vjsgwnwE9yjrmvTl7aiaGYGqFS2A
	VybUCyJZG2UWrNtwL3DQ/IzRFDkwyTzCOmNhu9KwHrjHx7/LI9Ep+1cnB8hH8IZEGqS7VZQvnkb
	Lr/nu89PARI7uAJIpRKz1SsRuaIXk9HUzO9X4vmWAXqJpsxkR+Sj2BsM3f06Un5Ffb1OlV6bKh1
	1YTCdPAwP8eyjxKdrUO7+X/YaJytWN1ICQyU=
X-Received: by 2002:a05:6214:260f:b0:908:a54a:5b29 with SMTP id 6a1803df08f44-90c5c402044mr14834276d6.24.1787087641169;
        Tue, 18 Aug 2026 14:14:01 -0700 (PDT)
X-Received: by 2002:a05:6214:260f:b0:908:a54a:5b29 with SMTP id 6a1803df08f44-90c5c402044mr14833806d6.24.1787087640706;
        Tue, 18 Aug 2026 14:14:00 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4580fcc4sm41326186d6.4.2026.08.18.14.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 14:14:00 -0700 (PDT)
Date: Tue, 18 Aug 2026 17:13:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v2 1/2] clk: ti: mux: resolve parent clocks by DT index,
 not by name
Message-ID: <aoTLFuE0seVTMuMy@redhat.com>
References: <20260727-mathieu-wdt-clock-theo-v2-0-c048a6394436@bootlin.com>
 <20260727-mathieu-wdt-clock-theo-v2-1-c048a6394436@bootlin.com>
 <CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Stephen / Geert,

On Tue, Aug 18, 2026 at 06:02:56PM +0200, Geert Uytterhoeven wrote:
> On Mon, 27 Jul 2026 at 09:44, Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
> > Resolve parent clocks by their index into the device tree "clocks"
> > property rather than matching names as strings. Name-based matching is
> > fragile because a clock's "clock-output-names" value in its provider
> > node can differ from the name used to reference it in a consumer node,
> > and because names must be globally unique across all clock providers.
> >
> > On AM335x, this caused broken clock trees where some clocks failed to
> > enable because their parents could not be found.
> >
> > Replace of_clk_parent_fill() with a clk_parent_data array that sets
> > .index to the array position.
> >
> > Fixes: ec7aa25fa483 ("ARM: dts: Use clock-output-names for am3")
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> 
> Thanks for your patch, which is now commit 667f420c09f1417c ("clk: ti:
> mux: resolve parent clocks by DT index, not by name") in clk/clk-next.
> 
> This breaks booting BeagleBone Black for me: I don't get any output
> on the serial console, even with "earlycon keep_bootcon".  When the
> watchdog kicks in (or on kernel panic?), the system reboots.
> 
> Reverting this commit fixes the issue.
> After reverting, I added debug code to print all parents, and compared
> them to the DTB, but didn't see any discrepancies.
> 
> Your similar change to drivers/clk/ti/composite.c does not cause any
> issues for me.
> 
> Do you have a clue?

Stephen: I think the safest thing is to just drop / revert the two
patches in this series in the pull to Linus next week. I'd do it now,
however I'm still waiting for my kernel.org account to get created,
and don't have write access to the clk tree yet.

Mathieu: Feel free to post an updated version, and we can get it merged
earlier in the development cycle so it'll get more testing in next.
Hopefully Geert will have time to test an updated version.

Brian

