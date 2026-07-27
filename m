Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6113F8EB3
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150532; cv=pass; b=NF0zZWFIP3nLftYDa3Cwx6yscKAJUXrxnfiz8kWg5xxuXIYjZBBcVbI0+ZmiWsYKuPobkGY0H/ONv5TpWLp2QYxugS20vgGeeThVs8Cr67UoVrPwcnp95Ulj8PTCzxXn0+vAmw4Iu9A4EBuGKSAc2L8PURKFpJH1uocshRZtjmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150532; c=relaxed/simple;
	bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEMyW/1+3V7RNHlvOr2eqGcUmOAj1ZIbpb+rq2bz27/sPA0c5ttX6xoOPAxuBEmAhKVAdR87ObBC4SPLckGufHGkZVE0tiQS4YBmyt6TTwI+X7/FMnhW6jTxfIvZLMEgZ4fyygBPQ3ArvhK/lY5JAGIhYOnmgmVUjaU0Ez2JxAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3mRoCn4; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3mRoCn4"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8114a4542b2so34405437b3.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 04:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785150525; cv=none;
        d=google.com; s=arc-20260327;
        b=HtmFXKLc/OEEm27oQBbbeaB5bJHUXBIkyUJezlZdfmniYGR3dRvk9sc653i/xO7Rho
         wliizCYZMhVYkprP5gDmtI/Lfl81X319mMaJ7TVSXwQqieNTbBJbDVnhtrY4zGSq+MR7
         i+nrCWDPfMPCXVgO3ApKYfr1n+vwEo7MvH/zmgXLW+L+2ANjBtT8VBvmfmSfE0cA2U5e
         iq1t8aKLSTMgddDaLPVqJTER7S6Wr+rA4Yu5Dn1I1jLJ6fWE7NZpzjyapg2PpOkbQrqz
         DnxqmTLToEewVBOeAeGqtVecHjpmcfpPJFv3kRBVfcA15pyqSg+uOmSflS7LLP7mBTrA
         v6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
        fh=7BBGbYBRjilOs4AgWK7APLtAamtdwWAlX0bbMcaYcMU=;
        b=At70RvM0IrJOsrZKS23RjkNnaqfYjQOUDZXVq+8HA+k8x3YRIU7tIIpKqDJMPtiOXB
         3EIzDjuY7347fmbHx+7rq183CXlNrOgTnpRHXlXWE6IyXkcKQvtg+f3gqvydOf6zoXf1
         /At8gDaXSpIKOQjVjbPLk+SG37n92GYy7zPiypoelQnPtjjtJs/WeYgufgdYmEoIohKE
         qAWeEli2MgsD4nkD7kkNgdHWfXM/zsgh9WC4kzgC9zGk3T+bgfF8hjnbB76ZSYPOmeEp
         UTOSIge1lm0p9/o6bjucUtoDEo1j8RFE0YHJFUsCVTBvTuvPCNfT2rFtbOEESizieUlV
         MKxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785150525; x=1785755325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
        b=M3mRoCn4tl8RPjfQixKwIWWGSOwAsLGhmh+pOW5tV4opu6k/FIUqHgtBSUi/lYWXNo
         K98eF+P/A41j+K8iwFXw6liU49SqTYrvvms0nmGWFjNMcapwdxy/m16HBI26xKOSiPvw
         bHpYUNToOx9zQJmLUksPduoTCqqE2dSxgHeSldgGIbLqv2CWqoDhAou0N3efVhSwmwfM
         VQbpCmhybFLItirVtnzw4TnneJchaVYJVzYdQrFlaDO4vxp9qnK66elczaAbAPUjs+C1
         1bvSmITqLw2KhR3gNZaWHhZGr+7ZSQD962od3gweFtTkzKTtbvFjOOIGdEoRbtgOHS17
         oVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150525; x=1785755325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
        b=TMZwzOsmpY4o5wyoNyymYy/Ps81Mv1yFNnUeG47xSrWjGBB/QH7Iguspf1lhBdYgB6
         77J8/JVAoKQzrqR+HS3Hx/GHkeh3DJs1my9MdS4Xl44UCSRErUIHGypasHashL1OON3X
         B6zZcgs1ACTGkaHQTwnOUmfWz2x9uj6AhjvYMtfSs/Z5QAB32KOpCAJdpXlak9Hikv5l
         e0QP+gn6WbOf0nTcdn5lB3xgNW7teFq3XpQYG3KWnfveWGZATHATCeMcP7Wg866+fms+
         rcyvoBYFfITS04fGm2qX+goXndFKOCbewtXix9CII5hnmNZLuTIL4tGVIHALw6H+QJ67
         ZIiw==
X-Forwarded-Encrypted: i=1; AHgh+Rp38fJGHXqIBq7/50cns+1I2DW52jHYtMtXNg6WdBDwFvVameHYQ2ilx0QZ0pEqkqxit0nWCdqiIfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqY2Cgk1rdRMb1ChcUKhxziKzcGB/3pbDRoxEJunikMN3Eoou6
	3ae4/jQrHEA+VsHBryX4sHo9Cy75ZKwgtUBpytQEL07XZ4QIBcxD6MCd+bY3cCwlHt5LcPYPhip
	UsTLFfiiKhEllD0aMwhE21EpGrx4TF/4=
X-Gm-Gg: AR+sD11+qTXZ18rCOLR16IEWXGh2iShIRpt1wn/rnuQsOelcfyjtU/yh/9ISFTd+dbL
	YjJKEfrw0N1ZLn/9Cb91HFbDlBgDkZDSSCBnEbxnd1+AHc/0lp7IXLIVD5wudqAp+nheitFN2yx
	5yf1p7q9qQlGAKrCK+aP50f0+k0HmdOnNeSbFPOSNwb3U113tZY8Zj92ftWhVbydHOhiiAb2Qcx
	DTImDGUfdU6svOY30rHkWctxTU40rPDSOxvjyxych/LA+TrCdoXMl9gQYw=
X-Received: by 2002:a05:690c:3747:b0:809:86c6:ee18 with SMTP id
 00721157ae682-81f69e3978bmr27868337b3.37.1785150525277; Mon, 27 Jul 2026
 04:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260724144822.6af8213f@kernel.org> <0ee1ef4aa7daa908bf28397ccc639c89b6aabd9c@intel.com>
In-Reply-To: <0ee1ef4aa7daa908bf28397ccc639c89b6aabd9c@intel.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Mon, 27 Jul 2026 20:08:33 +0900
X-Gm-Features: AUfX_mzhfgKW48GB4CRuyNKliFu1x1EH8aDGDqYePXeE0rGOBX3Wid5IOU1hKpc
Message-ID: <CABFDxMFMOAZ_3kYxEGCutnGt1OSSmgvmwx-=M1RxGc3VGKORYQ@mail.gmail.com>
Subject: Re: [PATCH 00/36] treewide: remove conditional returns with no effect
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Julia.Lawall@inria.fr, 
	Alex Deucher <alexander.deucher@amd.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Borislav Petkov <bp@alien8.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, David Airlie <airlied@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jiri Pirko <jiri@resnulli.us>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Johan Hovold <johan@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Julian Anastasov <ja@ssi.bg>, 
	Leon Romanovsky <leon@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthew Sakai <msakai@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Mike Rapoport <rppt@kernel.org>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ping-Ke Shih <pkshih@realtek.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sebastian Reichel <sre@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Simon Horman <horms@verge.net.au>, Stephen Boyd <sboyd@kernel.org>, 
	Steve French <sfrench@samba.org>, Takashi Iwai <tiwai@suse.com>, Thomas Renninger <trenn@suse.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tony Luck <tony.luck@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, 
	Yazen Ghannam <Yazen.Ghannam@amd.com>, cocci@inria.fr, amd-gfx@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, dm-devel@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, lvs-devel@vger.kernel.org, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jul 27, 2026 at 5:30=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 24 Jul 2026, Jakub Kicinski <kuba@kernel.org> wrote:
> > On Fri, 24 Jul 2026 03:45:02 +0900 Sang-Heon Jeon wrote:
> >> Patch 1 adds a Coccinelle script that matches the pattern, including
> >> negation and constant-comparison variants. Where a local variable is
> >> assigned right before the check, the assignment and the two returns
> >> turn into a single return of the assigned expression.
> >
> > Huh, I thought we already had such script. Various script children have
> > been sending such "cleanups" in the past.
>
> We did, and it was removed, I believe in 1a617a8475e8 ("coccinelle:
> misc: remove "complex return code" warnings"), because people just don't
> want this constant churn.
>
> It's perfectly fine to have the error case and happy day scenario
> separated.

Thanks for sharing the history.

I checked the mailing list. The removed script looks similar to the
new one, but it is different. The removed script reported a
conditional return followed by an explicit return 0, where the error
case and happy day scenario are separated as you mentioned, and Johan
also complained about this 10 years ago.

But the new script only reports when both branches return the same
variable, not the explicit 0. So, I think the new script is close to
the restricted version that Julia mentioned 10 years ago, and it
should be acceptable.

>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel

Best Regards,
Sang-Heon Jeon
