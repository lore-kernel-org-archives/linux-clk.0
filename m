Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA152F362F
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761558815; cv=none; b=qzQudGr09uTOoe4SIhIfod3KJ58ciHsNQuaY3M30PZLErHtMgVy19tqBjE1G54FNLsaHBe23TU2nBSmy5DrgOD3MozvOXd3eddnRaDLNXIYLE+R2PkEb3lDQkuyWEtWT4RP1DEzUGPozzV+OUj8muYej9/cRYfX1epAjsSEbfYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761558815; c=relaxed/simple;
	bh=uHZIvBo2w1MTfQAp1MbdkxhqheGGsSeb06hs1bU0eWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1G/Ul07PmQpumfnk8mFEcydzEWT52V7eiQQBBdNVDr1CKB4v4fT0/DtxEeAC+sSLOmmELC7f/o1whDaeavsEzIzsJi1s7VRAjDLj8bOAz9W4boklX3l3GdMijv9fYa3qmCrCht2oRejm7GjwGlPnIWCySkZj2mTj9nIE+TSElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlpY9PJK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlpY9PJK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-290ac2ef203so40874945ad.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761558813; x=1762163613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHZIvBo2w1MTfQAp1MbdkxhqheGGsSeb06hs1bU0eWo=;
        b=HlpY9PJKpXoOw9bpQk/Jn2/oQXTaHngwg1iB8FfrSBzs56KS2scu7zIbEtIP0X+N2T
         LoP84Kf2ucYUT9vWrd7iWmm7YbVy6FHam5D3XTq6TUAejwR31yW+tZ6MpG7kNV1vwp/L
         4AwUuV51ozl0qusm4LXIgdHzHGM0V2FpH8mmRblcjFeLNCk5NvLWaigJN/uddS2NpxXs
         0e4X0bFnw5lx9Rvm5xD6WeGPRIoeV39KR2Isidorw8oXMI0L/BgFbGT77Fg14Awu/oH8
         5rdOj/9M3ca434CGgsM4jkd7gIQTGP1T+YnVokilN2RCeoeZefbbva0OVPzsRNIon5VP
         OxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761558813; x=1762163613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHZIvBo2w1MTfQAp1MbdkxhqheGGsSeb06hs1bU0eWo=;
        b=JQrUi/UEsci4Vo4TDIUE9D1Fzu6VMV0e8yjmCe5qGsTTnj4lKqIyCYBwInYgYOV5E2
         zTxPxHi2OXGT5riMRZftUFPkUvRuPMeUD633YuOWlMg3woYGeeEoPNKb05UwqTAxN16Q
         RlDerS1+GqCXwoLgOQmC6gqUry0SMAtiUW11Apoc/XVyLPhj1qlKY2o/HYcnpUmtqSkx
         cmY14y7AIl7y4fuJ6kdDnCBm7JLabnew78CWeOiqO8BiqYx+wF6Ev8v7//oNilV/3wqm
         uGJqwUjbgiIMlRTXsaERv/c10FelVtb42/DnQc86dJJrYGzPNnQb0Ebx0kcdQBI1OHdb
         rZIA==
X-Forwarded-Encrypted: i=1; AJvYcCUHTF+fpCUYSJcpGhuu1xa0A1AlL3p3eurCb20BiWPzgzKgAK7z7QmjHuCpcwiif6l/dJDZP4VunwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5DRwe9EYhHXkNK7dpyDobpmtusVwMxDe1MlY2WOEDEVY0lSc
	4AeRhl8WRAfK4O3jq7LlEm5eNvy1sVhFUegBTS/tE9khPi7SOiQhREDIroTZE+GHGWdj0+4Ea3+
	F9ZdEEbwHKlH1Xa4KwdaaVT2YPXdq+pU=
X-Gm-Gg: ASbGncvvy0oLHMlvA5B2Ggw4cJC+p8/w378CU2tVVpMW0ei3T6eKcPpbyJPAKS7ag3g
	Ys8xmV9zOWWQ36f3lFo9bKDImNfpq0dTtVLIH3Fo/KVFs81ERnOnZV2Hs+1IOv0uH92d4xQWvCI
	YadcHuxXzjRNXHmINLxlOWDvmBL8FVYSna6Jb9zgpW5a6RuoLUqpJcHW8SLbG4XDzHo8NOCVnNm
	9V9O9NO89owSyVjU1rHV49NdCrG3bqsuXe3l9hyEEgw5tbMZjEm6x/nXLdkpCtBKXbUe9/QM4t+
	6rblvcWTvWHUqRoxyBaOjufIczOSPFu7wrc=
X-Google-Smtp-Source: AGHT+IHtoK9BtAWkuBlb8wHMY81e3C7F/tuuKHdZ9dReVXpNyDrBKViu/Dmg9ERnj0atAtepiwCmQJhoe6CLgiAV9x0=
X-Received: by 2002:a17:903:38c8:b0:26e:d0aa:7690 with SMTP id
 d9443c01a7336-2948ba3e147mr140058725ad.41.1761558813104; Mon, 27 Oct 2025
 02:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 11:55:58 +0200
X-Gm-Features: AWmQ_bn8djVWD9T3hbxz5BaFzJdgRNmgPK4MMnk5oMPTdlZh7IbRd6rHqy4Tk8c
Message-ID: <CAEnQRZDXhb=ssjbL-SOWXN74pjqzKgwXQ3SUUaQYMJapRPgKFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
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
> Add documentation for i.MX8ULP's SIM LPAV module.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
