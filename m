Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6A387364
	for <linux-clk@vger.kernel.org>; Sun, 14 Jun 2026 14:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781446091; cv=none; b=dEHh8LXCDAnZwB968U1Qqz/Dm8CjQJ9NMm0Qt7V7JULJ11VF8odhPngvbZWN4mCTTDoVe60OrJFSKuYQy652TzBDKXVMqwaU87X+sbCD6iJ09P0bCn+4V7pCuuh8S7ElXYejcWrcV9CBmXHstpII+HezQ178YJEgrVw+YmiYCJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781446091; c=relaxed/simple;
	bh=vZ6sLuNEBwb2pkhd5qu/rn+wBwxOy1DXeVTlXK6rZDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EnQk45keAUIha3Wzd2wIEsJ+D3Rslh6gXnrdAMJkoRg+lDZEpQEvW1o2B8Zbhc+5uMt4vcTTfFXhXpuEJtg3zNq8NTbeQLKEKlK+Pk5+2Idf/SWQZZeUGtdJgIZ0VK0tPwnQo+DxUIJtDXdhMW9V6xq85V6ozT2XE9NHd1kPT6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SL0c6Tkv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SL0c6Tkv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so2012273f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 14 Jun 2026 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781446089; x=1782050889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZ6sLuNEBwb2pkhd5qu/rn+wBwxOy1DXeVTlXK6rZDU=;
        b=SL0c6TkvAOjiS4a+T0BD3hQYJv78tN0qebh5TH4l+9HI27TQ6wbXsXD+pkmdd7v5Pz
         4hRcc1Qrx6Y9L/kLIf/DBBCQZj6bvGjvMAAwDMQw+ZYPz64pxjF05p/3OG5LQLb6XzwB
         +dPucxVnDdH5CRe+dTEQjQV+HRJcHfFXeSzOqRGXc2Mla4wF2dYui7B/CglTPXUdCXRO
         SxosPem4lxJ847Spn+4UtEEIM0doDUWqo/hR3iyseo+LiED7OM9yZag0bph/H/zkXP/n
         k3VfEcU5aoBaWxmqWVlffxNgs70PlVVjss4sHCDYKuL/1A8YkYhsrIZ43rT7aYASPrmO
         S0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781446089; x=1782050889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZ6sLuNEBwb2pkhd5qu/rn+wBwxOy1DXeVTlXK6rZDU=;
        b=oL6rtQgHyVu9rnM/KgcTIUrWQak3FIYgYINWwj0wiEzDC6Vcv+bAt6r0gzO8AuBby4
         xPA3alCpJ0UgWE+/idGhhzhCVoAGqBT4s3C9Sy/BAmH5Iyr9PeYJl6xtSo4l7LoxjBgP
         6cZpPgRi4PD40+QnSrwFpiNGe3emsHH5DmB9P0mmDH9oG/MDTB5FhkYRK5T5bwirCg9I
         un1uKL+iXtdrI+oKwcFakxwwyUZ9dSh6PkPLQaxqBYjcg9OPWramm4+Dm+hj6yYFfSgg
         tiOGE/V8yPIo6250VNlqocZljDRpODrRzr0AfVn386ISAvgSQL+/GBSt3h9ZET0QO0ge
         XZFw==
X-Forwarded-Encrypted: i=1; AFNElJ88zw2CuCSnxBwszDoPrWl5U3bHYsPrfjWBOPH7OnGU9vETJDNYBR0JYFOfYtZRIhelHZGfTjGB21M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+JbjBjsMRmPubJx9j0Vy+x95GrrUrREK0CT/epHjNTx4aQKbz
	QUTZkgqA/mDP8N/pYoKaSuMrkA7TIKqXsDa4jR1rIx8d4206SBNARxnq
X-Gm-Gg: Acq92OFVtyNKqkLOld1OgMQxylmrMCbaYk6JafrYUfCrQvZnMxUcGX0U0GGynmQpkfW
	5+Dbs1Ahn/5nZGlv68B61//Bibp/eBuAfhLnwHhoHyRu/bgPpCIKH1fOCepPcZPSm1Ur6U9QWHx
	PIJtrB/eWgi+VQnMbCHim3WXgN9vOc65b/6nOtZbEauWrLwUhuTkV5/qNBbklkIWUDAL9PW6QNI
	Hh7yWPc7j0wb9Ny1OWLbYrcxiaOze3N0DgglrkngcmBDPKLYO6tfBXIU9J2u/N0x90uA3K2KvpU
	me48rbKnnq9FheZNRx7IApU2GiN3APGOOJBsaFjA0cK4zPhO2nuraUx/mqhSNBVp7RUeA2kS0Fv
	jVnnNLzjZcTcnJBn0YFu5+5vzjhPylFqG5VwhcMCkMnSW+v4pNMdMV/0cAO2lkehcn5pJ049ZxC
	WLaFp0jZEU0mKhwmEUTZYPWkLzA1BllObqykIe3PF008QG
X-Received: by 2002:a05:6000:984:b0:460:3234:293d with SMTP id ffacd0b85a97d-4606dbce8a5mr14655307f8f.40.1781446086390;
        Sun, 14 Jun 2026 07:08:06 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f450sm27152837f8f.10.2026.06.14.07.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:08:05 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg
 space
Date: Sun, 14 Jun 2026 16:08:04 +0200
Message-ID: <nIKN_benRn2Bk8SDZrkMCA@gmail.com>
In-Reply-To: <032c1099-40ab-470e-8cc3-af6d3cad22d4@kernel.org>
References:
 <20260509190015.79086-1-jernej.skrabec@siol.net>
 <ahNuuaVlDl0KvOSj@home.wens.tw>
 <032c1099-40ab-470e-8cc3-af6d3cad22d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 25. maj 2026 ob 14:10:38 Srednjeevropski poletni =C4=8Das j=
e Krzysztof Kozlowski napisal(a):
> On 24/05/2026 23:33, Chen-Yu Tsai wrote:
> > Hi,
> >=20
> > (resent from new email)
> >=20
> > On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> >>> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>>
> >>> As it turns out, current H616 DE33 binding was written based on
> >>> incomplete understanding of DE33 design. Namely, planes are shared
> >>> resource and not tied to specific mixer, which was the case for previ=
ous
> >>> generations of Display Engine (DE3 and earlier).
> >>>
> >>> This means that current DE33 binding doesn't properly reflect HW and
> >>> using it would mean that second mixer (used for second display output)
> >>> can't be supported.
> >>>
> >>> Remove layer register space, which will be represented with additional
> >>> node, and replace it with phandle, which will point to that new, shar=
ed
> >>> node. That way, all mixers can share same layers.
> >>>
> >>> There is no user of this binding yet, so changes can be made safely,
> >>> without breaking any backward compatibility.
> >>
> >> There is user. git grep gives me:
> >> drivers/gpu/drm/sun4i/sun8i_mixer.c
> >>
> >> which means this is a released ABI. As I understood, the old code was
> >=20
> > We held off on merging the DT changes so that we could rework this.
> > I can't find the actual request though. It was probably over IRC.
> >=20
> >> working fine but just did not support all use cases. Why this cannot be
> >> kept backwards compatible?
> >=20
> > AFAIK the "planes" block is shared between two display mixers. As the
> > commit message explains, this prevents using the second mixer, since
> > only one of them can claim and map the register space. And on the H700
> > (which is the same die as the H616 discussed here but with more exposed
> > interfaces), there could actually be a use case for the second mixer.
>=20
> It explains why you want to make the changes but not why you cannot keep
> it backwards compatible.

I guess it can be backward compatible, but I don't think it makes sense.
Yes, original driver implemented original DT bindings, but there is no node
which uses that binding. If there is no user of that, why would driver
need to support it nevertheless? Supporting only actually used DT binding
allows for better code architecture, as there is no need to support second,
unused path. It also simplifies testing, since developer doesn't need to
test both paths if code is changed in that area.

Best regards,
Jernej

Best regards,
Jernej


