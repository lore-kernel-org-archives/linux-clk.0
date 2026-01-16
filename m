Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3E1E51EE
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599063; cv=pass; b=rolS4dnP0srr+NzTxMJXSyXbk/qWsNISbK4VlTg3Kt3kVT7tgNAtR+XUKhy5xHVG6loA4tlaCkgpPmQn3RSU1MFfZ+WpQwAA0pmXxsuFVJRlF5hmS45r9WpaMXjuQLUsGV7Mro+5HQevMw5BUEXPwp65gFJ6bIJWB46DG50BfTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599063; c=relaxed/simple;
	bh=vvBMNTtYjIdNhiUtcgxPXcGSrQ3zdfmugL08dxlZpp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raHwA/IX5hSZStDXHk0DzIhwFXPy1NwEKoSC9QAYVYY6rOpMD3kwsCc1sXGMws/DevlK4p6djJVjZsQ3OO9K3wuhmrXDUp0HPuXYXmp2IaQ0MpPrb49X19FBrfwf6Ne0ORQfnfubklnBHQBNjff7c/F/IqlXRdu7EUW6t5OsuUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Jn3jS/XT; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Jn3jS/XT"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fc0f33998so24159797b3.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:31:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768599061; cv=none;
        d=google.com; s=arc-20240605;
        b=QZrpPJClS4qXrlL2TipzzxrARZJ44AH54uBBCSfRVUY0ujK2g77DSYTN1l7TaN0gKx
         xxtGbbu9xmsq3M+GyJMBxmDdZ0Pwb6sQrwaLSD4mSziAEJyRGblEbCis3dtwXmhXr8ou
         rNr4A5MFW5Id8ZvmNxIi0bPrC6TYGzREMyUCec9pe4kgUM1ecNiurlmtcvNO13jiiEum
         SnqLIeslGGd2q1z/1ZoIl7SxrcJvWht+ymj7KtMcI/vIAJq9GBdQLtlofPH9neSdJ1+I
         hgvDN+6WhhmaAcL69euIjdd1nDdtP72rpjzreEYAhTgBLc4k3TLekFmWuQcm/H1tE1eF
         /51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vvBMNTtYjIdNhiUtcgxPXcGSrQ3zdfmugL08dxlZpp0=;
        fh=uZp86ASRjuU3N7erv5M1M6v4ear1ZHIvdeET3WpqDCw=;
        b=GPOQXxFfC0g5nX7588s7icvIFHRqUHVVrW90Zwxce0vZhsAieqAPDqgVB+XaMwfPF+
         uC9vFTXt2ZuL3S0b+HirRuTLKr9oWFizHT/ydoGnnNpajdRMty2d7rPcIZ8MtS+VGFML
         zjeNE93glaK1ol5j/9iX4rDsxiBXIS4KdBXuHZ+tyqLAjO0Zx5VHyEphGiCyrJmaIQVs
         AsuMHDoOmukJDIXjRPPR5qZ9yjuiNtFQ0VzFU/+4id6iOvQY+qac1kF4Gtl2u6Y/RwBF
         sGjx4aweYr2I9qEBTE71b4qgfIK+iH+JnRf4FUzX7U4htie1saZJ4EkdK+BBkyml53zs
         i9ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768599061; x=1769203861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvBMNTtYjIdNhiUtcgxPXcGSrQ3zdfmugL08dxlZpp0=;
        b=Jn3jS/XTRi8FuvKI4kzx5YKe1FRNz6EsTQTD9ZlsUztMXGVTSEK0APQMwgBLfbsANk
         MMpY8hbd5Ag+HfyEv+gLtZQvBuLxOPtkxcJK3/7gNpdMCTyInww43Tskl04Wl1mm+5ep
         jAQ7ZLtIVJwdOcOU7y5jzeeJaTbmrIcvxOnoY9pKCrg+TbZ8H7F0vKe8aip6VmsoZ79p
         QF625iQlpqzxdaTZTjGgxHl7AER7uJoSQWwRZBs1k7frKjR+T+m0NEH9JdYHk/WpA296
         8BBN8W8so1tpYd5ilRk6/vDVtBE1z9z9i6+nIuDgZx8Neepd7swpIdLbf/cWTLGNJIDp
         zDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768599061; x=1769203861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vvBMNTtYjIdNhiUtcgxPXcGSrQ3zdfmugL08dxlZpp0=;
        b=sG8heyOsmSJTW5AW2WJvtC8jO5DU9DSTISVsmFE5hHC2YNsemq/M2cNc9d0TQ+dbF6
         T+8n53LPyZzTYqvVwibwqtQncrm2lI4NokE6Dmk/LvG/0bDkgfihovx5iJ0TiuOOY2Zk
         cB0DXK1B0focZpSUt6aytwvkgqB2dY/WpJA3TW1wlKhhiuXCbU9y7wrP81aZA1niJuer
         plQsg408JFVct7NwIyx+Dnv6BupXdI7sMoyhXFbTAyk8/nfPPZ/IRH3Sa5WS8LRMQCqz
         6hN56OfhP7wsNNrONwIByI+7YR3/Td5iSw6nK6IhlhQWfKeE8tyJ2Bxxs9FlCdcLOCuL
         jfag==
X-Forwarded-Encrypted: i=1; AJvYcCWhhB+RSI0Mksx6XXBcHgPZqAPy3ceSuPK7h+BaLkQ95zXR+ZXZoos6bNuer1IyjwAdbo7FyQl430g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0P3fpWymxBVyjxvm/NAzxHbZaOrNPYBD85DhrARg5kdUmDJP7
	CGo39939ij9IVn5e86vpZdCDjaSDJc5Bos+rpO4kC000Yr825VAYgX+q08Ydf/q4Kbt7rUYqz9u
	2sC/KrM6fnZiY5ncQlLQbthCJuARZZtUe+kX1vcFBsA==
X-Gm-Gg: AY/fxX7Hd72XgoaBGTYMxo7AVeuzUVJF7MOdPcCfm5vLgUfW9OTLRg+wzb8Dp+8NLig
	KsgkbkqRucvtdyysGUX2G82GVxPi0rVxQGmrUFFeGjNP/vHm+v2BOAkpt9y4XrWFvyQatU0dye8
	Qpl3jse8KVUcL/jbaxx9X9jVLcomVJ7Tm5W8oybsnJVYpoxJcg4CQFJY48UoV0logBwpOtSUCPv
	J8szIQlkh0/k1IKFuhWlCZlXKnXV11OcrRB6WzFbWSQThzvs6RBPHqWAg+EGmCkoYxv/xdZkvLr
	QQTsqK80AaVXF6pqza6q7/5L5E9rT/FzGodl5jjW4bxvZ9A+6cPw6T7qiNFBRRxF+CLHGiY=
X-Received: by 2002:a05:690c:e3cc:b0:78f:b820:f2f3 with SMTP id
 00721157ae682-793c523ce6dmr77707577b3.12.1768599060916; Fri, 16 Jan 2026
 13:31:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-8-7356e671f28b@oss.tenstorrent.com> <20260116-pretty-maize-cuscus-fd1cbf@quoll>
In-Reply-To: <20260116-pretty-maize-cuscus-fd1cbf@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:30:48 -0600
X-Gm-Features: AZwV_Qg_SKVdsBkEYiEsvS3rA5LuKeOql85INJDNfPf7p1rAcP7anRwsxzBwm-M
Message-ID: <CAEev2e_LhhN2uZvQp4r92FLZNS7qYhC=Nn6NeFwqRw5OGjv4Lw@mail.gmail.com>
Subject: Re: [PATCH 8/8] clk: tenstorrent: Add reset controller to Atlantis
 clock controller probe
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Jan 16, 2026 at 3:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> Completely pointless. You do not have any user of this.
>
> Adding a few unused lines is not a logical change to the kernel. Why not
> adding it member by member like one patch for empty struct, then second
> patch for struct with adev, then third patch adding regmap?
>
>
> You just added this file! Why are you adding incomplete or even buggy
> code which immediately you fix?

Regarding your comments from patches 5, 6 and 8, I will clean up the
patches that add the auxdev and reset controller so that there are no
more unnecessary commits.
