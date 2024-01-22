Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7CD3B193
	for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 11:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705923336; cv=none; b=ljoY/kwOuBXwU1L2Y+QsuwzTb67CgjE1ZR1OXXO/Y8yW+TW2itTiLtP/aXVNRYOU0hWwEwXEl7uE5n5eGh7u2o425CSsi6lUiNGZwXLk2itI56loNuUJEdPdRZ/IbxbckKMYnI7+1JPJT8nvKjN9iahPRJmI2IEo2N9qBtXXieM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705923336; c=relaxed/simple;
	bh=MKhp81vARlwnJymH/8tghIShD/bDEWbnCKTlx0FV08M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PifJGZZSmStTv0Fq9yozcwoW6uxpECunLf0U5sBvXA0xy3OQXv/Lvtq8amzeQotRTqrTpKFBNMS0WGFN7UazROHBY3kUucIo9Q374nMlOav+3UXMfm2GrcaNMTh+9iCZ27UKN7mr6JAeOlO7sN0W4myTqlvRZK1zy6CfNyDSEoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x9zFhEFR; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x9zFhEFR"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-42a4516ec65so2535261cf.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 03:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705923334; x=1706528134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp69NjIciMowFkuRsLGhE3n0Q0pkwwaucBTFCSL5onM=;
        b=x9zFhEFROzvkm4Ru5Gq13L0nJXA3FyGCSifSUNwwzeKxL1CE0aPaJIIpICDzIuB/hO
         whqIU4Mn2Wt6/ug5QsG/TYXHaA34+SWf/gJ9oHzUf5+V2Z+SkSTEBBfcH84ToxFudQ3I
         E7fNVnwm+6Aa5qNjIixW/eWiPklIHOEEbPYWIoY21nrtbBX53fdkoTST3PTQoh3k2X/r
         eSj994rm94QIYd86EYFw3Bps40KfGrodioWbegUtzH2uP4sMQWoRgSmkvggRhmZk9jiW
         EaUjxWPHeyQhDwKg/VOOd7oqCOgAaKXM5OvWn8Yb9zN8Yaxp3kIBBFXN3O5VRoHi96Hv
         qp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705923334; x=1706528134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp69NjIciMowFkuRsLGhE3n0Q0pkwwaucBTFCSL5onM=;
        b=o+p7H0NRZ/POaUZhGyGTxD7Nw8uirtwtnXQClQapZkL+i97Q1Sac97EpQ93zhd3riT
         q2pPId+uTM1SV5DdLIw4MnrgCjE2rCfjGvptsAne2tAu7gv0uJOLGNFmUIEgxm2bhLOM
         slQ+QC+rPBFaS4yyz9HKbro04Sf0vD6KBBLT/coKap4d24dyp3fgXNqpeTXjksvepXm8
         pq9HGQmMZxSZAbeFslxqZmTyIx9BWy6VgY5BtL417gUObiaEwG7i8xjVml+2qD3pX+TJ
         ZVcBuzd/g5DDKAW25lfMJC6xfqVUDA6d9kxbEbcmc4dWkFBmtEAgZGJR3jwC/fZ4oFnK
         Eftw==
X-Gm-Message-State: AOJu0Yw+oVMPwxefVqt4aCzdceuAbq0DC/gkOa2BI+9Nes6KpcQrkJlh
	uF0sDZVbw5FRgrEDWvitWhnkRHf9vdvgNluP7jLux7clvaeXdlnbJOfIs9pQTVx79wL+tHTF33k
	36lo5kidiRhBQXr7vpTsesEyPdycRJTnS5+UNMg==
X-Google-Smtp-Source: AGHT+IFfbt1twZUvmT8z7VGChIkCgPKQHHxqBGrS63BoCbyR/vAH+owtPtC2Qv6lTuo0zS3m2FS7umRwUXkd5pMbv8Q=
X-Received: by 2002:ad4:5baa:0:b0:686:94cf:d742 with SMTP id
 10-20020ad45baa000000b0068694cfd742mr792478qvq.122.1705923333904; Mon, 22 Jan
 2024 03:35:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231222165355.1462740-1-peter.griffin@linaro.org>
 <20231222165355.1462740-2-peter.griffin@linaro.org> <4cc6df4c-504c-499f-be83-3b40d1ee6240@linaro.org>
 <CADrjBPo6YqxDAKUe629Z3e0MtmEgyTqEzVLLc1bZ8xJe_dw5SQ@mail.gmail.com> <f4901720-9df8-4433-976a-47d60da49f69@linaro.org>
In-Reply-To: <f4901720-9df8-4433-976a-47d60da49f69@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Jan 2024 11:35:20 +0000
Message-ID: <CADrjBPrPjkiPCxLj2D4YVXxGuSinWtzQO0CkDM5-5scd_Nx5ng@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: timer: exynos4210-mct: Add
 google,gs101-mct compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	daniel.lezcano@linaro.org, tglx@linutronix.de, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 22 Jan 2024 at 11:21, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/01/2024 12:19, Peter Griffin wrote:
> > Hi Krzysztof,
> >
> > On Mon, 22 Jan 2024 at 11:00, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 22/12/2023 17:53, Peter Griffin wrote:
> >>> Add dedicated google,gs101-mct compatible to the dt-schema for
> >>> representing mct timer of the Google Tensor gs101 SoC.
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>>  .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>
> >> I applied remaining two patches. Let me know if I should grab this.
> >
> > If you have applied
> >   clk: samsung: gs101: register cmu_misc clocks early
> >   arm64: dts: exynos: gs101: define Multi Core Timer (MCT) node
> >
> > then if you can also take this one that would be great.
>
> I know that you want it, but what I meant:
> If Daniel acks it or if Daniel does not take it in some reasonable time,
> ping me. Reasonable time starts from rc1 :)

Right I see, thanks :)

Peter.
