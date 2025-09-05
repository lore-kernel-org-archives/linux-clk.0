Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB992D97AF
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 07:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757057079; cv=none; b=WHPAo6nUTkzaQvJxcZDOwwws4FlI+JvSvICeaayJeKJ3reihmhQIsmAlzoN8SREyLILDgjm/c6l8y1KrTPO2wyWfozh20cX/Bo+SYAqXCOqUeWRWZkU46X4ZMP1AdERKPGjdvXbffs3hppcXuwEU/JXPRrHEMiDRiVs99LoZu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757057079; c=relaxed/simple;
	bh=OyKNmBG7aY30CUsH6LThft0vL3sOjRv4PBRyIA8/9NY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2nq1RIcs6j+3gtAOJ3Gnp2UfKq1QAVmRC2O3xN8xDmzQdGujAnE5IHdcJT+DvZY5flak/nFDqMcJ9F8NKrEio1WuNib5L5ydpHQwH5wd6JrB/8evt9HEmCMQD7GtaGbULEKdQFFk/P3cC9XyjPqembKgASZvjl9qqtFvnj4cB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T4y7Zqlp; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T4y7Zqlp"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso2068526e87.3
        for <linux-clk@vger.kernel.org>; Fri, 05 Sep 2025 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757057075; x=1757661875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyKNmBG7aY30CUsH6LThft0vL3sOjRv4PBRyIA8/9NY=;
        b=T4y7Zqlp3JbqjDcSuyMxKuQ65s1HSZHa4rQU2jwHDrET83lNTxQ3J/WVUjIKQW+KAP
         Rn49e9We4gvWjVqxJMvRviVxPBwnm0FfrUPugQOOdQu5mcm0lglyMsAW+TLfqvAACVsN
         9jENFECC9J/nFhltr5eUV+hfKbngGFmNNkhSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757057075; x=1757661875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyKNmBG7aY30CUsH6LThft0vL3sOjRv4PBRyIA8/9NY=;
        b=h3Klk/FgDWtMdJ1hxgIsU4/pswT4MqFHkivKCONgemxhMq8RZGrY0u2pJdzykTEgzc
         ZJ8BmWJgSORjHz9sTHQEs+wQyrX4UIhyVKsRX4ZsDtfDEqsss6unm0CfuZFyejvMeHxP
         hJaYNsXoFXp4+Vf18QbCitQ0iEr1/xjI+wmpmzlvLJe56VNwH+uIXsBKKDhP9jZSZP1n
         7cSSYniTCEUuHvrSaFa0MEQv8K/SszgQWQ6E9/oysjrJwAh2CIcjqSLt5gbjVJZloUMS
         e4dd8ctiHzoyhw3ezTJEYUwNOwEr8iuLe199F5toFUa5ZMn0Avpbw3tFz0krfg5UhNoZ
         QmJA==
X-Forwarded-Encrypted: i=1; AJvYcCWNRbCiwUrreDbEsA241Db47zxqzDm8Pi/5F2FmxZxwEMh82mmDfLYgfSKc+qarE1+pOpvXy0hU3SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEV59vGV/OCPaEm86uVnudd43GG/C6huU9D+s6Z8fU6UY1MX/V
	xmCohjazmURhNQzcY17FYObm3wv/80nFSBCgxTTLJocDWk9NQsdH+cAUT5+MUkeNkrzRKVWlTG1
	H0/cu7sdkKrxBy990tpCuII58tk67morIGipHFQMn
X-Gm-Gg: ASbGncsfrdEATaQ+PTEI1FLaYonLWTqX03/rvPhQ2OfAo3hsGmjE74DX5GgXN57vjMv
	m31qFRxEtDkRsenCCJHfa6fujmI/8r48oYGrMmxPJf44dyn+Ag09LCY9L/3bbMK5vdQszsU8V2+
	Xgof2GB83WYBUKWuxmPfgSu2yzgq6gZlhQrEGKjl1e0AFdfFm3Pjjf3Y2jUEUuhO4NvYf/YGzwv
	S8ts3AkLDSQOSpBx4M5TeTcsOYY2Tz+AbKFzPq7VVvasnnD
X-Google-Smtp-Source: AGHT+IHsGV8p2LrSQ+5ebPuG3MwZsxnB0+XdK0d6HB4AboER/GhIXoUDzaGFZTbCNnePZ5YQiB7vHJZTSeMi3MgtzZg=
X-Received: by 2002:a05:6512:3d11:b0:55f:4e8a:199c with SMTP id
 2adb3069b0e04-55f708c2538mr6024739e87.20.1757057074896; Fri, 05 Sep 2025
 00:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-17-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-17-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 15:24:23 +0800
X-Gm-Features: Ac12FXxXPTzm9nG4j13NbvkvAJ8eK4LgCQVwRNdKf80aBqhtT_PDYtc5qR-IPds
Message-ID: <CAGXv+5HjrwPJBC-wina4ZrQe_3FBWcyZc3e+iaCCmNOKfMicsg@mail.gmail.com>
Subject: Re: [PATCH v5 16/27] clk: mediatek: Add MT8196 pextpsys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 pextpsys clock controller, which provides
> clock gate control for PCIe.
>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE remo=
val
