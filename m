Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702922E040A
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777240; cv=none; b=tK0F4OM85qVMJc/CPb+WLOhxB+rsLrLZ0j0tqwa4oFl2u3yeJ9dgILtSRWbeeAr1ZHb1xy8lg6BKh2jzdZxioDlqaIp/uCFYHP04bDDRpARhOh/1PaF3uNAsuvjXqOyRlGXUs/lGa/aq4DhxM6cherxZ5PFFV63VAZ2DHsqknb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777240; c=relaxed/simple;
	bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4eredic0DU8+YkhSC7fGGjrTv75d8Qm3hElZjPqxbBnZxGKMJWJeCy07P1EWYKX3S8VMixNoCVkQlQQuuTEhZEs6EzZlJGQG5g5IbPGUsPJbeKaeLZlMlOyJa197yiu5PdaqxJl0eFWb+eUvwSZreMUZOAv0ONgY2KQ/nQMyaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EeTlcgdw; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EeTlcgdw"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-335360f9b6aso16795381fa.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777236; x=1756382036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
        b=EeTlcgdwYygVPvWzZ81l5IByZT3GZgdfLnceLEVRtnLKn5kjZAK18d9RTZKllNN3R9
         UXNJuNZYhZL2/q7EIlmuqT/RNnXonu0xTXfM7Mu1hvzHJXxGStRwQ8wUjUvu1nmWe5kJ
         bOvHqJiyfkTBFnPalQCG/zkNmCKpV4C//WOnsggDAKiSq2dxxWaUdzQDpOv4icRLO6jy
         FLT1i4qApSx7t3oDdCbKZI6Uo/XCgFeugJGvh4s4McwDReUaIaDZCi4GNX1+YPb88r4q
         FyMPyu6OD1xEbix9HWqrFIy2K24Qt+lvmhMkS4VLBb67YbyhwsoovUIdJ3elz5ONpvok
         A3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777236; x=1756382036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
        b=mqjtKfdraPS303G6WNp1bvPabb4/580VEKxp+16vcn//tDqEIWhEwBQfhufdyB1TxU
         eH09lcwDM7ME+tb07S6FcJCYqVWdBoXZVCbsaXMH1W82rRzu1p0Tc+DCzOYKH1bj4/9Z
         WSDUfhDUS++OpAPoD0jpCc2xOnhkP+Be7hoEuybxsFCxDX32KDQruyjdHBGy2J59MhiS
         0ynNvybutZ9NTO8AJfiy/rYuof/AS5hbzxRRt3bD0T37ZnWM1Pu8IDBOFWet3ZasPl1X
         QWcRr4fqOt1Vsd7+cMJ65hQeIuNZVxMY41ixRDOJSVB5y0EGsTP4mL2yakt52j9GjmI8
         CxtA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6ooMh8KLiLy0Pre/ovnn4GwGBxXEOHZB8vbBnRrWIGb6DJrshYc7U1Zu+YctvMkEpF5DCs8sTUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM1TroDaYtEXCwviu4IAc6lh6DzoAtS2r+vhkTMHKCKzfGNxaF
	Myo5QbRKYiaKMSYMZtMQcR1f/V90Z96FvIu57oJR8jO3D7vZGcVE+btxbR3XDyr/ImBrekAXbkN
	OWhR+DpjAL2tJToKl76iS9Za7lAae/MQt6SmwDlDKig==
X-Gm-Gg: ASbGncuM7mMZnbDFZXSA0mxLoo3SgIKPg1ch7i5MzQte0MmXuf2yHgrTCy6qIO23vy9
	jB+9gJvyO1teef4VL9VUT3bu36chqid8t66hPYiDydcmmx7yA/F+OjMzb7lsV8YD+JsAtndNFN8
	IpZ7rC5nx+1DYHMIYTHJZz7IthNOYY4WEVBdynkfwLb8K0mpdwEChyeUZAC7zkn0ga88+mPsFh1
	PC4vCo=
X-Google-Smtp-Source: AGHT+IFoewdvNuLwpOMDi7tPmb9FEQKLI5JEdERuyolhueuXHZ2+5KnKdkT/j3cc2QMbmt8jG7ipw7ObSBOoHSZHVLc=
X-Received: by 2002:a2e:a013:0:b0:332:2d5c:e171 with SMTP id
 38308e7fff4ca-3354a275fd8mr4061531fa.11.1755777236482; Thu, 21 Aug 2025
 04:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com> <20250820171302.324142-10-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:53:45 +0200
X-Gm-Features: Ac12FXy1SuiUzS280qDRSJHcA_2jVr4y-FjGItB1ru8eWVK-JVnc9Ql5XGWxM9c
Message-ID: <CACRpkdbVqNpz2HiAz+_vFUkDy1TE6ZDxp6X2g9rRWAt4s=jRgw@mail.gmail.com>
Subject: Re: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl:
 Allow gpio-line-names
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 7:16=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
