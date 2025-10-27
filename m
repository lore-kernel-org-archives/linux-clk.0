Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBE52F5472
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761558711; cv=none; b=tmglDTBSie1cqk4FgY+hvvMswab20m33hiM2sLvFr921iS7nuio059y+rXUN3ou1w539YKigK+EfzQCATpq3hfKz19DFu8gBQuwgPitAtkPFek7iVTxR2XsHV7Tmk2wRcNUt/Cjlao6dLqQqFJ5JmRB0IYzaSxaQK1HJ6piXQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761558711; c=relaxed/simple;
	bh=xIlMXVZM7u5N4GC7/QPTBmuvnR/eWVEU2XMt5zd3xvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKSuid99bTUGgQ4QynV779YKASSkwGJwFRqKWgIiNeb+UWK223MYLmnTHYbM3NCgEiJOV5r3iER0d6sHxFnJ2kJOEOCS/rwVDcbJW/trkx9GRjj4Tyhr6F4B63/0zDopexbwxcCbpOsNoUshPuoMT129+UqfqcPGSUKJLKNS/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU2xlnB8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU2xlnB8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27ee41e0798so63989665ad.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 02:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761558709; x=1762163509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIlMXVZM7u5N4GC7/QPTBmuvnR/eWVEU2XMt5zd3xvk=;
        b=NU2xlnB8jPVF2UDNNhtDK+3QMQfQi8vXnjbpOh/Kcf9UCYBGzqRSdDYnb37CEvTcws
         i/K9A5FYCx/kUYdM5l16IpqmKvmrC9sfM55e6xOX2r6qwDm7XQGRd+vhla46Y5Oefvm9
         2vXfxxkdMgazL2DNn2YgUC7etK6NK6Si8PsKEuwIi+PgddqsGpFwvPtx1R8sLMVJz/+3
         bZRFRBInAYzd3/sAFdLL6hXmVFp02N3Ce0QNYWKf9VJDvdOvIp2jWp3dl+zlt36NRDK3
         r5mmX1o4ik+jSfxMKjrdEh2DA8T58WmyLGKYB4Ql3oHM/LsgvFg+lUd0JlWpkju3R8Qp
         vccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761558709; x=1762163509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIlMXVZM7u5N4GC7/QPTBmuvnR/eWVEU2XMt5zd3xvk=;
        b=T6BX5+lDkZmGERvayVtH/onswKtBlKzGgtxkRyTwqrR3M14XUAmztYMVggn5qbzlnF
         DEWQ1wybeQQzc4yr7vv7DmsipiizP3wapPSEEppcrgsFxlNINKGZ4SAjFJFtYoi9qxb0
         D37xEvwQP01aet5QUgAQDprSagITLxBolu/t2kdK9A7gxnsC5GHWqerPYP50RbmFFCXD
         GDnyDlm0n1f+m1N2eIFyJdQFSLNSLI5D0K/olKVsHKTdA7kB3BmrZnf/EtFxfQz8fQtX
         kW/HQSybyyZIgw43WvLe66riI8ppgtqPbyI3vHpItV6lqNhFCOT7mQDBYsmtSJ/K6TVP
         fSBw==
X-Forwarded-Encrypted: i=1; AJvYcCVWIwdZrwCrjxhDmxGwzSA9vvID8SKtIkOpX5u/VKe0SQ3LYFo4G5Dl83f2w4BYPhBgypa/gkofQIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9FDT2Vj9HDHnHuA0vHTxgNPEwF34InwILT7ARfIgI+gGMmcJp
	UFBIcMTrY6JCwcII77S3xQaC6kRVLGgSZIItNvgAaQ+sDTiNj2d69Gh5HzCU8nLD1DnRXmwbQsH
	c+y9GNyeXVCaE3LIWOFfLg7+vCeCOP+8=
X-Gm-Gg: ASbGncubakskBYANOJ7RRqVyfZLAQ3rE/bT/K9jNB3klno4vZ66nTCGdfBReJYBodLV
	uX5JlAETP2sAvdjBpMvBnSt5SOKUbZbecwiXhG5qq+fJEZ7d4B/ZsbHmCb7kC//c3eBxLmdkVVg
	jiu1pUe5FLuAVazVp8xp3yCPkfLW35IlxIq3xnIBa0hPDQ6HWgflM6Tm1s8Sdc4nvOc45olCNZb
	RhEcyrIIuSz1CktIJhrSi+SxxouUjIObAXQBVWJU/9xAK3SkmtacNFzdXlrEx6A3pD05lBytxts
	TjzfZOYeegTk4XTzf2rxi9kn
X-Google-Smtp-Source: AGHT+IFRzbIzqFV7pKBghEkL/y5mdil9BPJteZ22VTJLWtgkr233BhWTD9Jj/7BDpxsKVDDIAx7A2JjJcaX7rlq1vtg=
X-Received: by 2002:a17:903:2f82:b0:290:26fb:2b91 with SMTP id
 d9443c01a7336-2948b8366cbmr145344475ad.0.1761558708890; Mon, 27 Oct 2025
 02:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 11:54:15 +0200
X-Gm-Features: AWmQ_blOtiRFVXUmTtN1O1lNjloemNSQ0tmWC3j2G4npOc3ifmBMtfeWO07HwwM
Message-ID: <CAEnQRZDFkQ80TGvpCDRZgVtKF9oUVoKQsaAtyhYHWHAZsg0fHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 2:22=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
> "memory map", the definition of the EARC control register shows that the
> EARC controller software reset is controlled via bit 0, while the EARC PH=
Y
> software reset is controlled via bit 1.
>
> This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MAS=
K
> and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values woul=
d
> imply that the EARC controller software reset is controlled via bit 1 and
> the EARC PHY software reset is controlled via bit 2. Fix them.
>
> Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more r=
eset bits")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
