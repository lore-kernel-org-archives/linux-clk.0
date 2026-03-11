Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068E331E85D
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238332; cv=none; b=BoJa1BnPAqU037Ynbr6bYZcoNMAiXqnK8NMWvfhKk1hH+15cP5+vLWyKVOqsBCP6G7hpOtoGic0YB8O7URO99palyktR1MT/S8orLAyoCCwENMemijcazsZQ2/d02cusAygFsJUwkAMlXylk+1h3tMS+C/Aq4G9pMIbkK2r+3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238332; c=relaxed/simple;
	bh=POUJjzeRhBIXfPGojdZfC417KH92loTKx1KmDpRcfoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkEpM0mVpfWbfFxGEC9Zp4VedNwBNud/nekL5X1c+m8DpQcjCZpcNT77EIw7IvZFUAidxMhrL15aRr8z8dTe/MoGWDE7uBnsar1XSnZ6G55OInVg/d+PBh+z6R9f0YUv8VU4bnhjxdsK7GAkzSyWCkAFpx6A1ZNnZzphcWl1Yns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9423d62cbbso151136666b.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 07:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238329; x=1773843129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz9Fr5w5J45ZN4rxwvT/0kjXMGfLP1VpB2aKPOax7k=;
        b=dsKvy096fS3stUSjXBZRGsLGDyzMTWvkvlX0Rc9qV0Kqo3PNSf7fHMSx1gUYfzqRiO
         INZBOqF5gyfcLwJ0bGtELPIN9nUvIkTSHqqNWnHsRgd163hsPOwnuauRLNjkzmxQYQrS
         QLTqgrO8lbkiEAthm3LvB2i/0rf44RakJa3MfMsGEvjgY60uRWnK/1HV5hLX1I/OcEOe
         o9Ez4bd95MpFJj64hOBMUoIcGSUntQ7gK68t2pEj5DGPr9vNAubAswtnEPm8WaWyf1uR
         OGvft4BiOlgp5bzLWV1dqs6b4YBdvgfwa0xaC1sLAyDdkQDCOOVGq+dRDjfqWrR6fDFQ
         1Wlw==
X-Forwarded-Encrypted: i=1; AJvYcCVwu78M9ZlNdyBNTOy8ogNQJU76oDBBPBflAvCnd8MgLZnilmX9zIryvtAcCby0qN6RQ76PWVgPlYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYnt5FOjQ2MaBM+DHoAuIm897L63i6PElGrstiT9RFmxiS64u
	WrZizpECS5EHsefy+eCsuTai1/IpvRR2um1XLI/ysnCHN0J1IANdpjg2T+pWHuhb5RUTCQ==
X-Gm-Gg: ATEYQzyQjvrr4dhEoEgxEloUQD9T2U72i07mk+RDdiyVFPb4y/ujMH7LYphVOJz4BhM
	TyBuHnNM1OWCbeYKCCXxx6Ytpk8c5DL/6mqJUGzAPMSL6lF57zMRe4uDQqXbr1zf7doUR510zxn
	VruZSLY9xwXG2hZTA18ix5Ak5ROXROxAsM4lHNyl123peOaED1bMH6hqvRKvAE0LGRAPWSac8cD
	bYMLjGrZ/r3esNd4EO6DaKYQ+lupemXps6i9IqOS+AteJbV62R4yB8XoI1WNLT/RFCzkP5NV9Vk
	jjgAKVVxXN/ZYRz1M7rYJWEEeE+7z6KzuRgqTOq7rVeWIcAPF/8kOw9CPJIDK/6lZBaAStJy7s4
	f6zXTyx3KGF8Fl0YNpzMv61pSapXuJAwG83vLDhGVuFHvauLDC2dFdiZ56ELxISIRRMuFV6oTIz
	aLL0srftquvKfp/Yo6Ow6574fMnQvgYJ5Vkt9uQC0sZhSipBvnDN8vIGYM/4ht97x97r/i1sw=
X-Received: by 2002:a17:906:dc92:b0:b90:bd3f:7c0d with SMTP id a640c23a62f3a-b9711a78478mr395390366b.27.1773238328965;
        Wed, 11 Mar 2026 07:12:08 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de82bc0sm57288366b.27.2026.03.11.07.12.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:12:08 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b93698bb57aso170192866b.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 07:12:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBcL1Dt8OTG3NapvJdOwc8i9kx2Fz4N8gJEjkxEQZC2tGegqS3IKL0kYSqs0v1GDG3FJlZ7nOU42s=@vger.kernel.org
X-Received: by 2002:a17:907:6d16:b0:b88:4f25:81da with SMTP id
 a640c23a62f3a-b97113ff0b9mr462021166b.0.1773237981235; Wed, 11 Mar 2026
 07:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de> <20260310100750.303af303@gandalf.local.home>
 <20260311141332.b611237d36b61b2409e66cb3@kernel.org> <20260311100332.6a2ce4b1@gandalf.local.home>
In-Reply-To: <20260311100332.6a2ce4b1@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:06:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
X-Gm-Features: AaiRm53WEGMMLW4z34e7P-lM1qFvsCJGZ_o4JNL5NPWbhJPKmcqz6k9bJcyL--8
Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
Subject: Re: [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over manual NULL check
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org, 
	apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org, 
	cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Wed, 11 Mar 2026 at 15:03, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 11 Mar 2026 14:13:32 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
> > But if you want to use IS_ERR_OR_NULL() here, it will be better something like
> >
> > node = rhashtable_walk_next(&iter);
> > while (!IS_ERR_OR_NULL(node)) {
> >       fprobe_remove_node_in_module(mod, node, &alist);
> >       node = rhashtable_walk_next(&iter);
> > }
>
> But now you need to have a duplicate code in order to acquire "node"
>
> I think the patch just makes the code worse.

Obviously we need a new for_each_*() helper hiding all the gory internals?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
