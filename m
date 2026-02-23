Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738A9155757
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856390; cv=pass; b=h5yiYZ1sKuUBandMSvXI8P8zGRkItwb/Ws8KjX2tjM8aUuHiPlioo45ZSXX803y9mzKui94aCsk5CzwpUosUOJl3GMQLzoBS2JJ5joe6jo59F3fnoerJLoDy9hGRiO0PyysJCPPalhN6wLm+zfuJYvJNp2GilwyJ3cOTlyaZrOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856390; c=relaxed/simple;
	bh=FL5LZ0gh/NYYvf5+Fxi1ZAVTOpQS4effQ4pJIcnfQ40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHTfvVv4cRChfS6xqmMMuGV2wTHeq3+srTRlPFH26u/NnG9pNswrtR0ZF9sDY6La3wBLQb+2mSnkqPsuvO+Is07cUNOWuAaIRWc2+pD7KMBUS4LwvtqBSJpV+DXlXTuw8W0XRwAJt1+cDD1Nw5gYi4hCkXUtYfcfyO2UkskyTB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvwNQJMS; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvwNQJMS"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38710d7d8baso33790461fa.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 06:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771856387; cv=none;
        d=google.com; s=arc-20240605;
        b=NfkPHtI1MfQpiRYcXj3+Mkarcu2bsXtpsmx4AEMgSpb81R9olE9vX7nTsHvvaQToYy
         gHmNgsZ9+WyGFBjatva2kS7p8ynPDhzulCcdy9hTrGOFoqq0K9qUZ/30jQb7J8rMg8tl
         0+4UNPMkOG1sR+48NOswzW9faaWuAK2AZrnvIMaJVFwZea9oXImX0dfwvNIeTOjUyU0f
         2ykULHat+KFmGbKoeHllZS2J0l/JlaW4Jc2laRFdDN1BIKge/HDZBW5qsekmT+BRQ0N0
         weMNojufODcGtHFmJi5GXKGFKtriY/vm5ZrL/Q2Dqmcu9RNordj1uDowip5doLV+OJdx
         cPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=idrQ/jeVZq+j/eB7PxPxR/YnyxQLfS/V/Bq6MX5Ug1k=;
        fh=5Sodz7pBaKq1N/MK6wg0QWBIpz0xIbyN2v6aKQbrCrQ=;
        b=k2f/OojrxhTV70ujq6ULuxEDG8VI0FSRo5MneTdIepwMdcQin0yaPbawXV0mal2MrE
         DpjK8fsVKMYX/L4fIbbRWtA1WU0x/8GthNWm8aR23g057Jb+dHpIR2PS16puZAwFgef5
         XRCHEROKm+/t1cor7svKVj8FTb//oRK1347B58ATmESZu1JBQMyu2dQaB9t8GKHuH7Ff
         7ix0FOue8Qlh1kid7QMT1aFxsGS7an7smAqBGRLF4dik+N4z2QIkdxqx9tU/JnSb8T0K
         sGCtvdj70Fyl5iKxMsw7gVL938RxSokVlGhof4Q+XkBHmpWh9CIdu4YoecUsW8o1l/da
         Mptw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771856387; x=1772461187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idrQ/jeVZq+j/eB7PxPxR/YnyxQLfS/V/Bq6MX5Ug1k=;
        b=VvwNQJMS3KrTGTzyJQUlD7HQK+G748TSsgG9rNUfrm7YRwGlu3m4zkgXmjC0S0k7IA
         nJytBk1oeeHpo69kVnkhXAedxiyVODNxg/+PVFrWAEPrjiIL+vWtZ7tNamObRVB43b3y
         pfqxeGfi8WlCvNH7GJpOs8o81ZQiLVUkhoy8+ayQkPCUiirxiKqv+nq6EcYJohur4wu9
         kD4WCmDvLwyXZ8k8+qLgKmMl0MJWF/z/MxCEh7/EZhCFCZaN/0RbswccWKJVww0Bpzs2
         bvXCWaVO7uE8EruBhpEqq9N4TCSHsZPAWdDgIrxIcg1fzMbg91xKYtcflq2lh3drfUXP
         ZOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856387; x=1772461187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=idrQ/jeVZq+j/eB7PxPxR/YnyxQLfS/V/Bq6MX5Ug1k=;
        b=prx2PL8RyyaOQaUaDLCPNNzVa8e1vimbMAqD4/5NiyZzMVlTAfFVMt/ywFq29OOSGN
         G5PWoOhpYHD5dDC1rsXtCI1wutxkAgbpI7odeFb/jOpjwXpU0dNz7uVDTpwLV2T3o+fw
         Bro+jzp0XedTy+s0UnvMoVCZ7PDdIXz/bpfblASISr+9EvX/OQGVn+BpR15fV8MlQqnh
         NsmzaPHUK+KWiSro3cjz2BpKjwz69qvUoVOAexj74DGwvzkfIcVDSAXmyLyWx728BDwg
         qFpTK+C6jgBeWJflsIFbCOT3kvVSxLa9paV1LDIXUPfVlZN4x8Ygmd52+Q9wbj9ULio/
         kFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVjB1Ttoul6R2T0ADuxEBQXo4F3+EMPDV2E3ULziS75EsBLSshBzct3rVhqWeXYGfZ9y/TzaBTE3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2Z2dQYfmSaXjimpuM2NxqoXvIPpJvMTPaibq3H6gGq7qr4VM
	CQSj8324N+hZ/DjGpStgN3TG2ppjGoNtLw72gMAe0lC2NwzxtqR50IoWuqs8uWFaRCDaVLUj5zm
	HTANOebVcHFqRvgmQOvCRgQPRMXbYqMI=
X-Gm-Gg: AZuq6aKveFCuNsegeLxe9f0hy+1T5DWrHVcUpIqvejvm9Q4XfxCkQF2we51VhSn8DFJ
	srD46tGG3wT50u8JrdHpjB5fcMaMuQdbcUJOu5g9b4XHJBIGFGEJ0oqJlQrIrxqYSfl/nR/eFN3
	7DUCjjpatBvtJF6PFh3cyKEc45AGj1lMXtbzkOChbLfcm41MLonQAgpf+q7NLJ9MvkqTeL+1mOT
	AEKnlurJtSjS1B8mW0YEhJ/Z0wjEfGGouoSzWFM4LDDO+pPPY62+Hres33q1Z6xZUKTg7TLwW5v
	R6DPeSsOISOcZvPuYSSHUDMntXTbLNhda66Irx5RVhI7ierwZbYCzu0obK+iOw4fQ0YFYJU=
X-Received: by 2002:a05:651c:325b:b0:386:1e28:4d72 with SMTP id
 38308e7fff4ca-389a5e8682dmr26588271fa.30.1771856386303; Mon, 23 Feb 2026
 06:19:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210022620.172570-1-festevam@gmail.com>
In-Reply-To: <20260210022620.172570-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Feb 2026 11:19:35 -0300
X-Gm-Features: AaiRm53tQ9jeTLBl7oZy6tkKfexZ-jDpIbeaeuybq8k_hMkuBo9fYYBRcqKKldA
Message-ID: <CAOMZO5BdgjaHKA6xV5MzPLDetqy-+iRdVPn3o38vo3szcxEhVg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: rockchip: Add RV1103B CRU support
To: sboyd@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	linux-clk@vger.kernel.org, jonas@kwiboo.se, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@nabladev.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, Feb 9, 2026 at 11:26=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Fabio Estevam <festevam@nabladev.com>
>
> Add support for the Rockchip RV1103B Clock and Reset Unit (CRU).
>
> The RV1103B CRU is compatible with the existing RV1126B binding.
> Add the compatible string to the schema and introduce the
> corresponding clock ID definitions.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes since v2:
> - None. Only added Krzysztof's RB tag.
>
>  .../bindings/clock/rockchip,rv1126b-cru.yaml  |   1 +
>  .../dt-bindings/clock/rockchip,rv1103b-cru.h  | 220 ++++++++++++++++++
>  2 files changed, 221 insertions(+)
>  create mode 100644 include/dt-bindings/clock/rockchip,rv1103b-cru.h

As rockchip,rv1103b-cru.h is also used by the dts file, I think it
would be better if this series could go via Heiko's tree.

Would this work for you?

Thanks
