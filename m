Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E21DDC13
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168755; cv=none; b=WHGexIwBrHyqPAaod+ccXWdQpwx/QYJSZ//PFveQ/dUhIzwD08QV0IAwriZnbAAOCuE6JegAzNPVeP+GU1/2NxzI+uZEAX3mB87GRA3JZwF9QKeeRPdKRaKky165FZ4g3+NO1eZGBZ2AxXHdc6wMk67b2y/KETu+2zCM2taIXi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168755; c=relaxed/simple;
	bh=CmSgG8dgDVGowYqWp/vzfob7NQfDeXXWilwWB40CND8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NNupek9hmR5CNzlnkXQ38IcSloZRVLvQpyOmmDfGRwn+hno4obs0PCks2MAyLbeA+4BvVPXtHQmRzbBHrWOnIw4UErY2iN6BUIwAluhcT1IMlDGNNGyM1EDKwCAyheLvyhRR83Z4yT18iEJb7euM2cBDABX06h0MITDKVmG4o+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODnFXsYu; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODnFXsYu"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d518f9abcso663606f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729168750; x=1729773550; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLKbd68RzcxlFXK7q4vrGEd+fffJ1TMM8zv/7HYDcsQ=;
        b=ODnFXsYuVqeN5imNxMuTsXP49rINnfJwbqB6dqlPqXJF1QCS4flU6hHbEdzl9vkPoD
         JhiXnXVpauDasz71/s1st4xCUEJQyd056XN5/GCmTtwCfHCHEDsbsXVrx1ZzV1tL45LD
         WdwnIGuoKHJH+WtB34GBxgJsCphjW6AFTpgAqCMm12tnGgGdOsUufQ0fyUuYh71tpMwD
         emUto0uD3B4WUUNMv3y2yHaD7vclvjNuJi+S/8rLP6pW97i2J81iH0NoGgiAGp1LBvxJ
         BRWr9YI/XkBEGO6V1wUY5bNyQ85l6I3H8nsIQnsAhbmTotKtoRvVRkhJZFnV6H6lWsXy
         ZBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729168750; x=1729773550;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eLKbd68RzcxlFXK7q4vrGEd+fffJ1TMM8zv/7HYDcsQ=;
        b=nHtBZhC7KhHeZZ3ZTG+nzSOHriGmuP6Cb2ZUKv69okpyYDcRBn+Y8cCsQbr7G+3Qjc
         QBuvfqQ4rlzznp9Vk9sN6xP52X9vVNGgkjpWI/BByilb44CfGiRbbChdqljotHxnf+iE
         OokqzRYdTZXbTOvrnAZT92lFVfZFfvhikqGOgsIGouj9RDmZWw2mMeCR9uFBafNMkymT
         XaeS8n3CNSF1alIzTFqY7AvoiwGqeXYZSeMsv7FH4RDWOD1h3o1QQSABpYc/n8m0vyrd
         HspR8jqcveeQjlkrvnwuK5/BawEpdhR6g5NiTPhQvbi2COu3HxNxmkIpKSeUaPiP4Zg8
         I85Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5LfF9UQGllun+k1em+xbs0QHH/o7cmMbSsZsZJILOpYZC1gkfqN1ZCI2OTExETWqak8Qg8Pc8Hss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3eg6POTVQH6PP5e/RmzUYB7gP7dsHFJypWvzEbAE7XvzPdzFp
	abzWoJrzLxUmItJ1781EENGBj1kycp2WTUQJmnToYBZK1ldNXVhIFhtOmDvRluk=
X-Google-Smtp-Source: AGHT+IG7ejxJJUoO3H77hYt2WNQRu3rm4oMZyvw11lFYzsiOaPe5DscdwmGO2D+HP8vSEzTm8Trfkg==
X-Received: by 2002:a5d:5051:0:b0:37d:4fab:c194 with SMTP id ffacd0b85a97d-37d86bd59b0mr4879360f8f.25.1729168750204;
        Thu, 17 Oct 2024 05:39:10 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf80a4sm7156250f8f.87.2024.10.17.05.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 05:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Oct 2024 13:39:08 +0100
Message-Id: <D4Y35WNU7MWN.2Q3RHCLLZ69Y@linaro.org>
Cc: <konradybcio@kernel.org>, <konrad.dybcio@oss.qualcomm.com>,
 <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: Add Qualcomm SM6115 LPASS
 clock controller
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.18.2
References: <20241017005800.1175419-1-alexey.klimov@linaro.org>
 <20241017005800.1175419-2-alexey.klimov@linaro.org>
 <n4nbzwostn6i5ygskjfr4o7haqujodadxd2kspvlk2gccxoaen@pk3qj7rxvspf>
In-Reply-To: <n4nbzwostn6i5ygskjfr4o7haqujodadxd2kspvlk2gccxoaen@pk3qj7rxvspf>

On Thu Oct 17, 2024 at 9:39 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Oct 17, 2024 at 01:57:59AM +0100, Alexey Klimov wrote:
> > From: Konrad Dybcio <konrad.dybcio@linaro.org>
> >=20
> > SM6115 (and its derivatives or similar SoCs) has an LPASS clock
> > controller block which provides audio-related resets.
> >=20
> > Add bindings for it.
>
> That's a v2.
>
> >=20
> > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > [alexey.klimov] slightly changed the commit message
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>
> My tag?
>
> > ---
> >  .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 53 +++++++++++++++++++
> >  .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++++
> >  2 files changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115=
-lpasscc.yaml
> >  create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h
> > +examples:
> > +  - |
> > +    lpass_audiocc: clock-controller@a6a9000 {
> > +        compatible =3D "qcom,sm6115-lpassaudiocc";
> > +        reg =3D <0x0a6a9000 0x1000>;
> > +        #reset-cells =3D <1>;
> > +    };
> > +
> > +  - |
> > +    lpasscc: clock-controller@a7ec000 {
> > +        compatible =3D "qcom,sm6115-lpasscc";
> > +        reg =3D <0x0a7ec000 0x1000>;
> > +        #reset-cells =3D <1>;
> > +    };
>
> Not much improved. Don't send same code from whatever repo you got, but
> go via mailing list.

Ok, thanks! I was not aware that there was a previous version on
maillist ~ a year ago. My impression was that this was never sent for
review. I'll update and resend it as v2 if there are no objections so it
will become a proper v2. I am more interested what should be done
regarding older email addresses or maybe .mailmap will handle it correctly.

Best regards,
Alexey

