Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FED3331202
	for <linux-clk@vger.kernel.org>; Sat, 22 Aug 2026 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407192; cv=pass; b=u2AKH4myxiOvi0GY8X9YbtdSmUveYdt8RJutCfJ+qVr+pyeZCkviWYWjyV1YuUSwyYP/mHRUxVICqIN6jGxhHsJY+rC4m7ChfbbozjOei8P20DDHHS3YydMOgH1TbmPHB+MStDBcwgMFR6M7PnilMOEDGhe+UWcLT88edL+BHDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407192; c=relaxed/simple;
	bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z99ufX1MN9/KkxFf88Y0kJNfRMkVHP3CB6AjieNCtek4K5LjBuXGV4k+BMPRyH7pKJqNXrufIxO6W2qHGdZT4i4YPp1LdOss6OklqFBC1RGDZl5hj7tB70COQAsMzXlC27Zy87a2hmQwYps/dKIoxsV/5G8VojUajO3lzR5n/+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGdxrMWr; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGdxrMWr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1677c91969so235065566b.1
        for <linux-clk@vger.kernel.org>; Sat, 22 Aug 2026 06:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787407190; cv=none;
        d=google.com; s=arc-20260327;
        b=knqL05J9iWBYOsLwbzoagVnpYk3iTMb2wAgNzA5+foOkZVdPIistuaOo4KRmQ2Yfmc
         52SftIe3N2uMErjWWhMU0rR9shHmzG85vSmRyU18eQpAQrxkeVxAFE+wPy7g0PkxlZ3V
         d0oHElQiNPcnToS2p9m40plleJAW2hgaBLCLT5H4rZwTWkiVSqbz9/G5XzYLsv2yYJlb
         GJDDpALLJyN/2iMG0nPLole6mfsy33HqgtnL8gfT8cINZ3DoCdBfMcDuaN+0XuPcUuWE
         KhSmurcQhkSfALv/7AyxZ/oUpwxix9X0aK1QkIyxPf+ddikZbm6+a2WT1tzhs8Mg08L0
         R0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
        fh=PBWWKIY4tvS1Pf3+zTC2nIat+1z4P/h9sVTZcN5hidg=;
        b=oo7ctdNXVZoOOxj287C4PwosW4TraT1RTHFRoNoOcylS4rQRhYqKsTR0VxDaj+UVD0
         pclXbnJaMT2xDEbyPLGcMHlM4UssIILIxLm2YRM2VHWW0B7rmHhMpBphKKtAOnEXtY1c
         BbWKEJn4ymwjmoqhYSgFRDtdpA5QdH9+3D2Tle6DsPbxRIqxPBskldsiSnfxGrshGNZX
         3O+YS01YhGArdUR8A6LaE8z4PNw2ZLBV6P4TMnqprLm/URdguM/CYU/cUQ7MZ5Y+vWY6
         x5gOwLYBLXwfjvG9FJtAEVRy3cP3UeiH0vQES4zVmdpWS7bIA2hz6rKxtiMyMcjsVdeF
         fPjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787407190; x=1788011990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
        b=TGdxrMWrCrceaCkytD1HeWOuKVLxQNvlESnBiBxiO0VOwdPWRdQmDpcV8yWvh+Cub/
         IMDXIpbYSfQIDXwCGL2g3wKQevED8zEXiybvj8XkBqn9TlJOkyRFb4xLh41fFQ3ISnPw
         phaV+zGPSpZ1OFFh+KPHxEkwL+DZmuQV/L4HMCD9S7KeX4+bA2zXLUb0jdyUvnLqm536
         Yc3HOrMGPUn6w36h3Yx+FagLSVy65Yd8G5llJY6koyimhD8zt/RkHaD2Io7E4zqux6w5
         qgdTX8oQ4yRwrCvWxqy6EjL+T3SC+y29GL9AWvKMXRfZtElvt5wjLk4SXxv8D2MkWK+N
         Elcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787407190; x=1788011990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
        b=P38zcSVjeHGAXDEKDKQ+9XBaAFRdEEIc+RZO9DN19IAPokFL+3zYZEiOPuBLF8ZO+s
         p13NBVMAo/1QZhmxIONBe3gShdVet3SeZIWo+f5xcges+n1uV5fs1pLHNZs+JBu0E1b+
         PuYwV32g/At9aPbOie1qrlsP/44fp7Nea1JSC9Z77QXdFQamFWAQn6IIwrUZhrOEU4K1
         5qjyXgmc/pycdA9rPMxVujniwFeHrhvUnHK/rNx//Evyzy8ZsedMwg4YRte0JmE2kWI5
         NqRzOYRKAHveoofHgfdYSJJy4fk1PP1FOcfHemHrSYDevzDL+ardWES45qF5Pn+JQByp
         nOjA==
X-Forwarded-Encrypted: i=1; AHgh+RqnIHNotSIPCZC196L3FNStmGj360rFR7f/gNxzk3f2/7ju2fNsY6Br7jIW7lITZDtfFg9FALCuNio=@vger.kernel.org
X-Gm-Message-State: AFuF++ll8BKB9UvD8ROwejGcP46I6P5SrO4R4tEOtWiHX1CuiZ++VeZd
	V1U6tNvTclkxLR0TSQNJ1vhgjOYOXZbU30H0/HEjGyeTfWnDMHMP6vUEB88n5+8P8/XIjx0qg1N
	YxY9K7mP/HAA4yPzjoXvLjSnhpM3Oj44=
X-Gm-Gg: AR+sD12CO5L7YZ8Cd4efRu93GYxlAKgJtvz6zfPnnJ0YZitnN8QrgMlnQUSAqdC8hTR
	rlD5XBzZC0BGuUHS5vADhCKcWcnqNQgUwUYjNwTMTn+OmEBd72TIWu9P2pS405wOtGTYmtP9VOY
	ggSfQr/AVKuOKGQfAKrUNaW/BxPvPvSYG7gzLu1xXCdGtQ4Z52vWh7N+P0dLdS2hG7h/vjZ2Noa
	PDu41OzpNxKjIVJ9kP85ZDwTjGU1bWKPELopV3doyfoZY3LGOOG5u23PLUXAwP8rA78NyWZ9S81
	LGcHluPcHBAguL+0cBuSz5w8VHKHxneur1sUoz5txOheF20KW68aAT/H4454PMACgx58MnCSey6
	3lEgkymM=
X-Received: by 2002:a17:907:c8c6:b0:c1f:1520:4de5 with SMTP id
 a640c23a62f3a-c249257c128mr661278666b.1.1787407189637; Sat, 22 Aug 2026
 06:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-6-sreeshankar0910@gmail.com> <20260818211749.GA687014-robh@kernel.org>
In-Reply-To: <20260818211749.GA687014-robh@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Sat, 22 Aug 2026 19:29:40 +0530
X-Gm-Features: AcwNN1UInbL88MEaThabOx-Pd2MTrrUX4H4Rd5JSV9-PnyAPj2dgucrt6K9bcJw
Message-ID: <CAA-+ukLBfgWVf5Gf6qmX3_t1MsbuJ0hFshGfZzi0H_+HLWkE5Q@mail.gmail.com>
Subject: Re: [PATCH 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC
 bindings for SM7250
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, lpieralisi@kernel.org, 
	quic_tdas@quicinc.com, danila@mainlining.org, davidwronek@gmail.com, 
	robimarko@gmail.com, linux@gurudas.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 02:47, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 08:07:47AM +0000, Sreeshankar K wrote:
> > Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
>
> Missing tags.

I sincerely apologize for the issue caused by my action.
I am new to kernel patch submission and am still learning
the workflow of the patch review process.

I have corrected this in the new version and ensured all received
Reviewed-by and Acked-by tags are properly included.

The latest patchset has been submitted here:
Link: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com

Thank you for your patience and for guiding me through the process.

Best regards,
Sreeshankar K
