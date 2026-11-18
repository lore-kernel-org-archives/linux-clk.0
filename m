Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011130;
	b=rkeECxCOSinhfpGj70Op7HErTiRGyJzBKDZChh4fbsNq1vFbcyG7E0NNISLkCvRFibOS
	 dbwMbEY5CfyWyW6SYWeOtp0PE638u3z5kbLzNA47uCP6yM0v6Vy1bDDifosORVObibVLV
	 Iiqk61bYW7L4Y6Y+so5lQgf7/59V/7N4RV0NdDCZ/fPcVTIPp0VWbCAu1kZ8mVxklcKnC
	 1hh4cat52TMg+Lnhc/E1+J2Uvip9/Tm2jU8fLQXewFVz1ksoww9SSZXAHRVH7v6NHsFwv
	 b1tgRXiM5/HaU2WcPigVaapGKVBSn0YyZA0RYv9LCK+unc/Hr9dTOH3SPt/doFHuQfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
	b=kvIg2OIcNFjMhkGpl6sNjMr/g43q2LQ7z1Hw6HfC87CopSQyoyzkOS9JAODxVjPVyA8f
	 QPI1uwMLMWTfybexnnNl3omgyrzNjtasNLSFFmL8/c6p2mC/iUx8kw3gcdncRV3w/70hG
	 Lk2kjjQ8zRI8ThlezzdvUvnjInqSCkl9yE8HVKpnxwPLUgDM5rhSlQFnog5qZRiHpn2Tg
	 LIiTOA4UVGOQLvkcfa+CPWcvQcBERvYPln8bX2L6T3yMDVFdqsvO+KfjzB4fzoXT/MolV
	 i2VQKWL99AedkNmmUfSVrmiZnKnEsAipVxKxLOyoz7WjCk1j9p/DLj4SyIH/vvNWxPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X+Du2E5H;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B7D60A2619
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 14:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B7D60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X+Du2E5H
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso515197f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795011126; x=1795615926; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=X+Du2E5HeDdGwpJtkkybS4mRnYIN76epeyKOe0BAKNzk2aIzSHPLlFW1sPj87xh6QD
         r8+27iMo40fH3/Dfjz/gjFCrVzVzwYvkUZD9TFz9bTM2Tc3FHcMsL2SxK0ysirMwspZ6
         bFZaHoYqXkDu1jjng6iK63CdgKssDdTzOvbzGkeu4BC33Kqb/OL0JZe3/FnqX3w7/Q09
         CoxzHRaFuCZM5DNQ+HEpaMLG+idiYekrYrYyjwysV7ldZqI8eqFfS9p9yDN77C27r4nd
         aQWcGYi1pHhF3PATB+2bvKGeW6ek3lSjSwjVlq1jIHKFJ/2km/fmms3HIkfrJRTOi6Bb
         ot/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011126; x=1795615926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=LSkYE6/TneXwGOGMoXErO9tinLRFa5UAXwS5kgkPZLbv40we7STG4OlqbG0+psWhxh
         DX1mV+GCFRgJ+ilZCjIH7FYm5ehKXzav0734pLP6VURWwYxDKzZWbymITSKYynu5KWd3
         s4BRgHl2ob7GKOBAmIe/txCbBRxld89EEihFJ80sLllcEwffZOw+U3ZIKBLcIOaGCxtZ
         vS7PbwYcwwlrNckg/Jv6ZtZlYqgwnYhlWw/MFuRUb9esL0LHFK28+EWUuB2dWgqiYS0F
         d+Iur4miMttmOFgU92UVhzPc2qRUm8x/pqLju0NyNixh8Nq2gxSzfHMdX/UsVc153uq7
         PrZA==
X-Forwarded-Encrypted: i=1; AL+hErGN4ol7/FifhqCUT8+D79hBatQpTaQ+QNfPkH0/kvhJ3zhikqrk5Z8dHDHrVWsUru8ITpijGs/0zc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FDA7l7qKmA5D/JGIxcbLnwOWQXOG155dZ/Rf+D/1Iz3Cyixxe
	/zSLSGaVw3pBpu5x/adNDOkmXBmsj3GCPaVbW8V20txsCE/8sYiV1x3hDcAyREYG2Vc=
X-Gm-Gg: AZFdTZedFddCaDMtIRTvVKJXMG2Aue+DApR8BgCbnpi0o+TFTp5njhPmYB6hrutN4ZO
	YtyK/RaDTEU6fVPMi6hqzGdh8fPCh2xjM76OlDCAvU6GI7fEEhO3u2Amh7w5ARLCjxIrdIGcy1t
	IfOIOjRGS6VL88GwzQdC9lRRq9fYIS8OxrfQLNr5BRLCkFSjeGuJuZIxbP6NtOoFpduppHTcu/X
	Sg2HZTploZOz0UGbTr+XvX8yN0OndzoiXilqOtKqv1RffE2qNHh/1RZf19dxo9l8B6/5CCRjC2/
	ZvP249f80tK4dti1ytY4O1P4O6aRY2dta3CPlUaH5SMts5RLkE495WdWXd/LPhbdmJCIY4yoIWj
	iniIRAaDCjCwFFQ5yw2CJJUVbhJa72znl6ypXpbalx/l8+l+HAFk1pqu2ynF7Z3ufj8m59RIpcJ
	ih3IvCW2RoHIQNxIt85/RA66Vsav9WJ9Jxb2jq+sUVgduaeBDXCxmVaGzida0HH8X4WbLyBVcgO
	Gi1tMNgBH4VRac1i23O0y3e9vPL5fKaq3Qp/QKxRc3XBE2ulk+AhmnDGSq/ZayXSgJ+73vs+yje
	rQEZvLm72+PGMkyEpId+cPwOTT5Y61eqPZ7MjkIpQHI3pPF5
X-Received: by 2002:a05:6000:186b:b0:48e:88e2:fe6a with SMTP id ffacd0b85a97d-4a63f4623d2mr6222883f8f.49.1795011126108;
        Wed, 18 Nov 2026 06:12:06 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm5590663f8f.8.2026.11.18.06.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:12:05 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] MAINTAINERS: Update UltraRISC driver maintainers
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 linux-pci@vger.kernel.org, linux-clk@vger.kernel.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Fei Chen <chenfei@ultrarisc.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
References: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
Date: Wed, 18 Nov 2026 15:12:02 +0100
Message-Id: <179501112283.639563.5233054429317576626.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vlDn3aALOXByZVs7mEqRvuJC3A1ctnxY975yMiaHYv8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/N5nknC99zPPvkMAeEz+LJ/rb3O42SObtqLnBOZNhY
 rKGh3pmRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbyv5rhf+pRtSNHwkU+xf62
 3H1MSnpnB/t0htMrxT57Xp29uUlbppLhf/BEnSWNU72uGOXvU9VP+/jowUV9g7UhNjMfXXfY/J3
 3GgMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Jia Wang and Xincheng Zhang have left UltraRISC and are no longer
> maintaining its drivers. Jia's listed company email address is
> no longer available.
> 
> Replace Jia Wang with Xincheng Ji and add Fei Chen as a co-maintainer
> for the DP1000 PCIe, clock, DWMAC and pinctrl drivers. Remove
> Xincheng Zhang from the PCIe maintainer entry.
> 
> Having two maintainers provides continuity for maintenance and
> patch review when either maintainer is unavailable, as suggested
> by Conor Dooley during the UltraRISC maintenance handover.
> 
> Link: https://lore.kernel.org/all/20261112-legend-outcast-c2226b5e02a1@spud/
> 
> Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
> ---
> Hi all,
> 
> Jia Wang and Xincheng Zhang have left UltraRISC and no longer
> maintain these drivers. Jia's listed company email address is
> no longer available.

Maintenance is not necessarily tied to an employer.
It would be better if the people removed could Ack the change, and let
the community know they don't plan on being involved anymore.

If they do not reply within a reasonable timeframe (a cycle maybe?) I guess
you can remove them anyway.

That does not prevent you from adding yourself in the meantime.

I suppose this would go through a starfive/riscv tree ?

For the clock:
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

