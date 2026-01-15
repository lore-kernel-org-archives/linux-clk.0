Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B2F3B8BCB
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494272; cv=none; b=IpKQBiXoU821Lehk9kO4+WdM+KKBGGzd8L8ESntrR8o4epwXypLfy88szzBlsUsstNhuOhtfP/wMlYiYDsw0TWmjpWBMTN1emanEWIxVNP94u03EgbKs9tyUA0I5kR/UzsmCJKpzK5xuiWTU/L37dc3dECE3WV57rkDV5K4UeOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494272; c=relaxed/simple;
	bh=k7lNDE5gCSmeRgbwOBkK/9sHNPAfd5pEa5j5lNfKJws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adxsn05g8+5H6zyWY+YbiW3tyPuFjbA4kYpqAx3ZtLkpNm5Js7H1ua3f9wvdqeLJPX0Vz+1SPVZ/kntwpsXDVE2Ef5bPI3jYUyWngUalIt/NwshNYBntFINGLnfTiivUjTm2kRroUy2+kHsW2iCKmMmNJxSF7jFOwiHFdROr7No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=msLNEHfB; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="msLNEHfB"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso1997938e87.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768494268; x=1769099068; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UcPjMQs8wlZ69D72bOHJHv8LmpfNACepVb1D7xG/5V4=;
        b=msLNEHfBm8T7z1hOrKA17neRzVkyOrmk1NvuvMcmJqgb+rg+LVvlzR6GMUunQvhcp2
         R5g+ToG8+/rnSm9mBZ56uIklJVmlC75lI8o8dO5VwtE3H7z9nTMOOoGsnDB7jYa/oAZY
         GFsFjxaRxEQUrX0+3GGtrX0jiJOnzgkYNoOu7cjoNvkNkto8RdYLkRN3izHaToxzYmba
         SR44sqUP8z+96LABZSAld9cnxCGlxEGG6VpB/I97EnJqpx0nH9k8vvCMFzKIFCycb93W
         JgDE8fQDzgFfbjE1O6eHsWUPuLKXosjIfoPT9xkewZF9254KNuKNouZol37+lzXabMcG
         LEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768494268; x=1769099068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcPjMQs8wlZ69D72bOHJHv8LmpfNACepVb1D7xG/5V4=;
        b=gknAp10jGF7bY9T4UX9Kv3/d0sIKuMYodtrZW8TvfPq2m47yhtwL4zVa6QdYYjpTZ0
         ghB2xufozyKxiTcS/RzYVA/2Iystndln4QXpd2FawrcYYsihl+2mkoh/7+gamYrkVTSh
         OZzcML93jKPfdXH8Yuw5PlIBMz9Scc+3q5Ki+FzDoMZLicKyjWUtpWU7Ylg7EcgJoML9
         cdsQDHdJlSIvX4tge7cCG6M86UzYQLAPnXZ1IITMwNIfPXXKDNjJFm+2QqaNiT8S+e9a
         eiZ5byIWWKre/BQ1UwCYar633ZOFcJdfy1YUesAM9Q0DUxB9LTQJ9hktJssgiATF27ZT
         WMpg==
X-Forwarded-Encrypted: i=1; AJvYcCVluFHpfMqUTz4srrsUoQKCVAOrDnEuwA6IikWW9/C0pPaoeb31tJ0xDZSTGiSuWP8k3v/+/wiWxH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwugXe+sv4akBF7waGA7m/+aOA39AwsbqBX+B8/dAI55hOKVq2p
	z/w9JunGFxxoATQKtMJtMo+nBaGT4haaVw6yMfrh45g4qIFJLNtsc7PyWezUFJIjSwpTz1j7ut+
	6n6m3S2CrHeBvlaYO+2QcdwCPb5ErCPVNyItL6hReKA==
X-Gm-Gg: AY/fxX4teWn6oQDe9f9Uh5B6JxV/NuVDRQG5SL7bNdD6LZLqJJaGbMQYGy6XpJVuho/
	O6/R1fnEckssH/O/Rk7yykRq0CgdbYMvTOKVPB0OIR6SgNjS3xRApnjhfBIfo3p2xoaRzmYJ6VZ
	oBlzYDNWAca8J5t0Dx26etjMO9RuGs/+MToS/PjuYHGY4Um24VnypG5baOPCjlejCbis3IRAutX
	1T43iTQQyH98CgjFHQHqqyxMJsHRsEf5uvZSmgTd2BFi1svx7ndhvdq6adrvP8vIf0LxO6Z
X-Received: by 2002:a2e:3003:0:b0:383:543:66d with SMTP id 38308e7fff4ca-3836f09c3afmr8580341fa.16.1768494267944;
 Thu, 15 Jan 2026 08:24:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Jan 2026 17:23:51 +0100
X-Gm-Features: AZwV_Qgstc2v5holxo2-uqRefc6HR54B_5kwg-eT_5uV86kY4RNFn6HUBQ_JID8
Message-ID: <CAPDyKFohjOfdg1vz1o4FAhThm_1CTF46SgrWSJuJYt3mLLJwNA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix dtbs_check warnings for MediaTek MT7622 platform
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	matthias.bgg@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Jan 2026 at 12:00, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series fixes various dtbs_check warnings happening on the MediaTek
> MT7622 Home Router platforms devicetrees.
>
> Depending on correctness, either the bindings or the devicetree was
> changed as a dtbs_check warning fix.
>
> AngeloGioacchino Del Regno (5):
>   dt-bindings: clock: mediatek,mt7622-pciesys: Remove syscon compatible
>   dt-bindings: power: mt7622-power: Add MT7622_POWER_DOMAIN_AUDIO
>   pmdomain: mediatek: scpsys: Add MT7622 Audio power domain to legacy
>     driver
>   arm64: dts: mediatek: mt7622: Add missing clock to audio-controller
>   arm64: dts: mediatek: mt7622: Add missing power domain to afe
>
>  .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++------
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi               |  7 +++++--
>  drivers/pmdomain/mediatek/mtk-scpsys.c                 | 10 ++++++++++
>  include/dt-bindings/power/mt7622-power.h               |  1 +
>  4 files changed, 20 insertions(+), 8 deletions(-)
>
> --
> 2.52.0
>

Patch 2 and 3 applied for next, thanks!

Note, the DT patch (patch2) is also available at the immutable dt
branch, for soc maintainers to pull in.

Kind regards
Uffe
