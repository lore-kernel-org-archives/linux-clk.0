Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C98216E24
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763218067; cv=none; b=Vvw/AULujK4aj/Z4nmjCRjlrAnnXZ8adpIvcaHAu21TMC1ivIOQE9Dyyc8EVFGFFpXgnRNyLxZisWQHQvnGNckGKJ5WE28y6y+iivNlsCX+EfQfe7GlsA6EGg3G58LaEZRDToDpPx9ByCw3/DaIXHF2J6P5rLDLDMKiPkFpwXQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763218067; c=relaxed/simple;
	bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oGHIpDOGGW0CCo2clYW0gotThfwFG26VZKT8fIhewFBaVHSsbtL6hj7G6IflGcqUfaKsELW9v/RbdwbaXvE6V0mUBM3HESxnvTYCRr0Bvg5Ms4FjrChfFpHVAspRc7xFqDmGtWgl/eCjqb3DZw2ofK6iyZ33C2XkvRCfFjfWnQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5QP5GGa; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5QP5GGa"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso5497860a12.2
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 06:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763218063; x=1763822863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
        b=T5QP5GGaAXLFMo/qeWHn4rnEHUhz5DI46GAhlWaoe3aAw/k9krLs6gr1XFfc5LxILg
         Vl27MXIziSmY0hzdBqn+dMfuSDAOqk7PEN1T4GxoiekSaFpfICPYrGn9UNUc+zAF2CS3
         vspkyFxDBtDm4fFMRLEf6RjAa7youAbamvdpWhb5ubW1ZP/eGq7Zhsvb8gXnkiKhhtKC
         Kp/3OhBNVtOaUHx5SvUVTdCkbrJU546RMuO01/M8QGlXLTtOr9c2C2FfF+w6A6w/e3F4
         8H+v3R0QBmUPzeQgwa6HDR0TsyW1WTvYshRbA37kolkgdRLdmTgtGrgtnAL+D6GPlGqg
         sAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763218063; x=1763822863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
        b=X8UOqVsA+IuH2crMI1yuYnOGFxFWucnMIPLG3ZkLboN/hplZhQocGL9tLRFP6MgUxc
         OnOGfBwRLWy1JwfQhJlFfxpBYEZrEgMcXSGxAJPRnN9n4YwDIHsdIuZBDcp3F3pfCvL9
         Pxac9owYBJNlvsoNx6yte9ZAwTkNfCp6gTDci8lbWKih+FMpsHBu3gWzJwZON4h54w6C
         vqhPLvOSE/Z+w/4l5xcspCslVvZ+xRHALc6Nu2TQMfL63Ir+SIvFbKRts4hOZnm+XnyO
         8oGI1XBM3g1C4Y4eHSbk+DsBYzfMojI/Iy3mxYoFbEH7lm5h3vPamMU5rSDNtDUqrdim
         GgHg==
X-Forwarded-Encrypted: i=1; AJvYcCWCIboiPV/k/FCMWYbxXJP6+J8uLLGq1q3TRU+XCsvlBV2cguTgjLaQrDWsnHe/lyaKuHpJ2T09rOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZRkCknDOEaYpY2vjQHO+nOmG9Tgt2M4g9ZvFCZlJN+6boUYk
	+6TY53o1iVFBmjpG971N9Lu7TLiM2WO0dSbHEzMGbjShIhJVL4+vzf7S
X-Gm-Gg: ASbGncuI0VqnJ2NOQMcoIc9E/8xaRUYDT8dUvYPCwNV8+SJNLt4gwf9DhFVVYEBchTs
	6ChZnrI0l3JGNkq+ZvkNcnZobf6RIeIXAjalbw35e/EA4KCn4db/v4DEAPyZ/X/lPPPANxOI8N0
	Ec1zY/WnRdSD+X8QhqASawSihnTXiOv/BX/J3v31/npDMc/nbu2kyErPCoj5LpeHEWoWwVr15xZ
	IYix6fYt9aThexdhmRHVsYSzHE1wKC3pik+/3LpSPwQw92cojRakWSD8yJ4ZgdNFBNKAcZ3gN6h
	H7YZfpZfOu8NfSAD8WU/0cxGVChle8jWK2bl5ykGmWDL8jnV1OWZHim9IEEZb7qsIu4V3zPu/8k
	CM6tpI6rGZ9LyqhD1P7Q30rD6rNBZzaFI45WWCqv/G8QKnfJ//TR4dx/et6P1TPW2FI2nCtrp/r
	GFXU0kQMfzNgA1G2KWxfEpLCCpPXg5Lc2AbA7/gnU0y3Fg43FbYraFMCRHczPaiM5dmzKpFktPo
	ntPYQ==
X-Google-Smtp-Source: AGHT+IGrjk6XSc2vCyw9UdPnvD0sBuH/IPACkYBi6rv/j+NdjGAC/UWtwwJ0hdXjpnf0qvoLJ3aa0A==
X-Received: by 2002:a05:6402:42c8:b0:63b:ee26:546d with SMTP id 4fb4d7f45d1cf-64350e20abamr5640955a12.12.1763218063485;
        Sat, 15 Nov 2025 06:47:43 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d7335sm5917548a12.4.2025.11.15.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:47:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat, 15 Nov 2025 15:47:41 +0100
Message-ID: <2804739.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-3-jernej.skrabec@gmail.com>
 <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 15. november 2025 ob 15:40:27 Srednjeevropski standardni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > YUV formats need scaler support due to chroma upscaling, but that's not
> > yet supported in the driver. Remove them from supported list until
> > DE33 scaler is properly supported.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20
> I assume a fixes tag isn't needed because technically DE33 support isn't
> there yet?
>=20

There is no user of DE33 bindings yet, so yes.

Best regards
Jernej



