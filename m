Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272537;
	b=s+5/z+TGtgVS6JpahbxzSspWen9kMnm7U5FkymD9il7AlKnJJpMmmVtDLQ80itGBwfd2
	 eXGqaMBZL44ahx1e1EKfGX9gAPqXKrWYuIzsln+cr7BoLB/xwtsv7z1PuG9vGtGmRq3Pv
	 znQhead3Ua4UtglPJ2tCuGz7as6pRRCZGXlxejpVWnCCRlnKMV5AaSwKU1gXvxUXJSt2S
	 dTocinR7ZRAFxqiND9IIW4lfu4u3S3lnHCFWtjhopgzTj+gdY5hePihSSzYOq/8yAcAze
	 5n49b8LXC4tg2/F5pL3C3BF8QADfVps5VcHbW3yuZ2cor1vTGNTpJqpKvBJufUhRenQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
	b=aa2A1zdVkDttDB9+S9UGMtYqdXv3Cy1xeQYIz6YtVRSpszvamuH565QfQIkRrWjKAmhy
	 Utdv+bqyqhAjSyBQKNYIzEobJAzXxdpukJGU/kaiIoi+9vu2r+gGk+0X8D+SuWOGTlgm5
	 tk/L56Q4x5WqY7wlKhszwaUIsjYBWibwfd8fm8IG6Sh46Y3pWsgNprGCJmZCZ07JxGBfs
	 wcMgDzkzQldZcb9miG3/Fbqh4NI1pq6wUe4exeP4epoU09dwt53od6o1HNjbNLWMgnI8R
	 Eo9cgHrS8LvdaGBRVR06HdXFjtrY5xm17y3k9GhN2g8Msl6Bjt3S7mkI4/J9y0eXvmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddZnEjuz;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F3606A32A
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 14:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B0F3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddZnEjuz
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so846084a12.2
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795272536; x=1795877336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
        b=ddZnEjuzbdWoUoW/4tbAOHS9vp1GkI8ol1D1jOZqCCmgvyVZuD/hITyx40rje6PmnO
         L2bKPzDMD1Y8Rgl7HDxTiNdXliZI/LkEzkZxbz8gCfvYDsXS5OfUccZFb5s9VYhEeRKW
         GpMoMHTzRtaI5orPzWEmwmbkvaVBKELWc9GPKYfta9p7ae7hj7N4G/kgB6LK6Q7zDtEt
         IT6Ytp739R+9fTxXrl6VigiUBnTrvpJeu7GkmKvN7qB05yqbUi/NqOk6O7Onzq/u1Y7i
         r63ag27vpXzFc7VRoLZeoob8+B1l7g0iEr02eR6Qb/I7NlWsfX79hPyYlXSHbYbW+ULb
         80zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795272536; x=1795877336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
        b=FrkeejhJ1vY4nPgbDQQ8aj/vrCc1vG8ljC94zUnDs30ZHfzhDShvBoD3oAbBKsVBie
         Tbz+MYbNREu9X6xVHLrfRI5Hg9ITQtXA7GAJx9RqElXt7lANnNZorHxWS4poaSDOri3s
         Ap5+37BF/vYo663D9Y4fjM2hN08TlN1892IA6W/JA7RA8qSmBgmYXOqOpt99fu2hXFnM
         N8+zYTsL95OKQt3ZN2Tzki+mXYmPgMV05zbIv8bkhHHaB+blnjARx4EjRQtbwbz98WUU
         TEtCBz581LZaJBYXVfACYnE7bTHmVgMDL4jsEi/yNUVXdHkGX6aA86uyX3EEkf08P+/l
         HVJQ==
X-Forwarded-Encrypted: i=1; AL+hErHhqAn+Jk7eXKhVd4b7QV2Fagq/QYA2JGYhQplFe0tNFBVsqxosk7q4CpEekcHBLdX+LJDnVuBro+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OpQUjLFDPxTJCzauTTma0soj0h8ETGRgbsYhBG3MyInvJH/QT
	3fVoXG+IiEZgQ5Z7wVntJVq4DFmRDnNl9D4snhn7QFYCGdtuUk8b10X9
X-Gm-Gg: AZFdTZd3ZonYzxvTvciqMYrpmFB/2ccT5RqW1dXFXi9TygeNxoZu2RTK+V5xOHD6bcu
	Z4zj42T2pRfzP2BG/ft1nNQfbXtDI29CWNqocR4QSu7Tovf1W/gaZC4D/zt2SMzoPv0MZk99pnf
	Jrn/DTNty/HY2pc0t+OOABm90oCSVVis+A+dkczxOmpgUSXbeGRpugWXjVZagA0JMn2+jEr2rcB
	kgpTNX0bvr3CyJ1Snb2MUTWAnTRz67X7Qn1uLdX1j4suoIwoI3kH5hEHyYspHr9KG/CRDA1ynAQ
	nLDHNd789JBRI5vsix59B7310Z2Bm0O9Hp433fpPUpIRizXReAsFkWzIoYNtripXmIqBDW19bOt
	67w8IUudTEqziQR6+pD5S+DfRIIloOf00NNbqvCpCmyvpklvJRWvu+muOPbGMbXkaM58WQuz+2q
	4tsBu3Hf08KQtaIg/diYtqzJ7fcxZloilJwBqVJNJKAFej6eZ+32jMthEI/2i4f2RN00NDjRCEG
	AzS9D02vjuZmPSxapD6vSBlX1l6kE/BZIy5OUSjRQ6Y74I7U6zhGgW28vJ2eBjxfI5+QTjXSgBg
	bck0OSurLLxrpPxwgwChCLzGtKJnXuinoDh4r/ZAYHkwRKl5E/2g0F1CKQ==
X-Received: by 2002:a05:6a20:244b:b0:3ed:bbab:9386 with SMTP id adf61e73a8af0-4014d35ab9cmr6017467637.42.1795272536129;
        Sat, 21 Nov 2026 06:48:56 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm3048343b3a.36.2026.11.21.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:48:55 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: "Ard Biesheuvel" <ardb@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	"Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>,
	"Atish Patra" <atish.patra@linux.dev>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>,
	"Chen Wang" <chen.wang@linux.dev>,
	"Inochi Amaoto" <inochiama@gmail.com>,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: efi: Map runtime MMIO with device attributes
Date: Sat, 21 Nov 2026 22:48:45 +0800
Message-ID: <20261121144848.1277368-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bb39f961-0589-4a3e-b649-888cf5edd3a1@app.fastmail.com>
References: 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Nov 2026 13:42:20 +0100 "Ard Biesheuvel" <ardb@kernel.org> wrote:

> 
> 
> On Sat, 21 Nov 2026, at 11:38, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> >
> > EFI_MEMORY_MAPPED_IO regions are mapped with PAGE_KERNEL, so device
> > registers end up mapped as normal memory.
> >
> > On Milk-V Pioneer, GetTime() reads the clock controller registers and
> > faults:
> >
> >   Oops - load access fault [#1]
> >   Workqueue: efi_runtime efi_call_rts
> >   status: 0000000200000120 badaddr: 0000007030012000 cause: 0000000000000005
> >
> > Use PAGE_KERNEL_IO for these regions.
> >
> > Fixes: b91540d52a08 ("RISC-V: Add EFI runtime services")
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/kernel/efi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> 
> I can take this as a fix via the EFI tree if you like.

Yes, please take it through the EFI tree. Thanks!

> 
> 
> > diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
> > index 2d3cc57b4535..11e85d0ebc91 100644
> > --- a/arch/riscv/kernel/efi.c
> > +++ b/arch/riscv/kernel/efi.c
> > @@ -22,7 +22,7 @@ static __init pgprot_t 
> > efimem_to_pgprot_map(efi_memory_desc_t *md)
> >  	u32 type = md->type;
> > 
> >  	if (type == EFI_MEMORY_MAPPED_IO)
> > -		return PAGE_KERNEL;
> > +		return PAGE_KERNEL_IO;
> > 
> >  	/* R-- */
> >  	if ((attr & (EFI_MEMORY_XP | EFI_MEMORY_RO)) ==
> >
> > -- 
> > 2.55.0
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
