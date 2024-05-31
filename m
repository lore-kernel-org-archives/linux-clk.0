Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FEE142642
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149501; cv=none; b=sEPdW06FwIEEu7VncvzN91ODQ93xQfLAfePg/F28gd2nnPmt/8uXwBjOazuCzA2WJfm8MriCdsVlVXwAuRFnONZpkJ37u7GsTXZzTbr1XCdG0fhZ1auhyclWfZ7ZeF01+Bo3oqNFmRLK2JDLrdG7ZChOlMsUL86RVH1fONZPYK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149501; c=relaxed/simple;
	bh=Ea4m4EmsBzvUxnNWy5QLJCJS1X+Oji6ca0jQLxkoPv4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pQJQ5a1PBQj9oJ1pO3AZWHGeePB+GBMvgceINX54JAsnkQT95d9YjXWOEklhwIh32J5lNtjfFB4prWfIJ8cgNWRXN1LH3xRuEDqhwGsi6kBOPlVSLCPsoRpHS6bs25Ej0Jbvv9jWiptvxcmnbHSTxeRTsaIDLXcKtSLzq55MWvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hYCGEWcO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hYCGEWcO"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a667e104375so142977866b.1
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1717149497; x=1717754297; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyBdQ1giefiqSyIC3NfbzMQlfjGB07yddrZiRGX5tiA=;
        b=hYCGEWcONNNwPa6sCANY+I3DQimb+DOhmSg+sIm3z3UDZv7YqrIN74FHih0kFORKI2
         zN0gqr8tsUTEdQEgZFdyVVqdm7NKkpjK9ellJY6vuJ9uk9KRPg3DHYytte8P27V516V7
         mDXSEjfLHVbrocQLU2THdUpp20AHC73XDXVzfhRRWE1J3RiCSkZN6vV35+x/fiVAEGBM
         frPXlDoIf6N7ephsemnMUwUQ26aAOf5i5xdfBn3ArWiR1MzKN3Z8C9UrMLmoMj9ZJ7fo
         DUYVEXiukBRc+igRPfSeriio5N0+Xj2SIBj6+OC71jtvyXb5JQMEa4ELnk15CHCxOkQV
         O5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149497; x=1717754297;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KyBdQ1giefiqSyIC3NfbzMQlfjGB07yddrZiRGX5tiA=;
        b=DMS3AIVJyTRXiyF5HRT/mC+ejwcw2WiC4jvnXkA4sZjTEfrHP9aH4Bez5E2bTyxjZo
         MfC+PBi24v/3RRoA8j76TO2NuurFb9mCHyNGiPywF3hdPD2lIbFtXKQefNfGiXEyV9Kt
         VBT0nNDBUYWAf4cnGbPWTAz099MHma/D9C6atiP6tHywQJydA9dW3l9+ZtATkca15K67
         rW0xSM/Rag8vj+GGe5TJCkAFwzhhJfKW8RDZV+2i53OIgx6f3s6e9aR+HYiSDhGXzVu/
         hNtSA4MBiWex28yTWg43p1z8RsheJLYyGmF4LccWEEH3ILSbKQvA+EAwHo4u5APAaI2P
         U8Mw==
X-Forwarded-Encrypted: i=1; AJvYcCW/bOGCSpmIY/tKH98vDZ6TVM/PrURIYKPA9xEtZqxq8W2hdUs+3uYIW9yypXwrG6V6EymrAnPg+nZPp09k2QxJasMim34TNYD6
X-Gm-Message-State: AOJu0YxpnVUXmN9Tx5jZHpEfdi/Y85pk3gMUA1MhkmgAkMSyAS+x9K6h
	BpiTE4mHVTda8hVtSct6h/4B93E/UdRK7qEPfYNYnzPpLJ5dAihHxKZNcbVMtAY=
X-Google-Smtp-Source: AGHT+IG6H8G8r+vcR9GCR3uUp0/41DCkdZdVI0T3+W5qXfXIs/lpm1fZnLMxqHCcetS4Pi1XrDwzVQ==
X-Received: by 2002:a17:906:6091:b0:a66:e009:eb56 with SMTP id a640c23a62f3a-a682022caffmr77773066b.24.1717149497428;
        Fri, 31 May 2024 02:58:17 -0700 (PDT)
Received: from localhost (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm68937166b.53.2024.05.31.02.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 02:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 May 2024 11:58:16 +0200
Message-Id: <D1NQP0JSOAKH.LKPK7EBODNP3@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <quic_tdas@quicinc.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-2-quic_tdas@quicinc.com>
 <CZWOT0K3AE2F.1BUND7M9Q5RXO@fairphone.com>
 <d66ed568-8264-4430-a070-f353879f6b65@quicinc.com>
In-Reply-To: <d66ed568-8264-4430-a070-f353879f6b65@quicinc.com>

On Fri May 31, 2024 at 11:28 AM CEST, Taniya Das wrote:
>
>
> On 3/18/2024 12:41 PM, Luca Weiss wrote:
> > On Mon Mar 18, 2024 at 6:35 AM CET, Taniya Das wrote:
> >> Add the new QCM6490 compatible to support the reset functionality for
> >> Low Power Audio subsystem.
> >>
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> ---
> >>   .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml       | 1=
 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpass=
corecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscore=
cc.yaml
> >> index deee5423d66e..861b41933525 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.=
yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.=
yaml
> >> @@ -30,6 +30,7 @@ properties:
> >>         - qcom,sc7280-lpassaudiocc
> >>         - qcom,sc7280-lpasscorecc
> >>         - qcom,sc7280-lpasshm
> >> +      - qcom,qcm6490-lpassaudiocc
> >=20
> > So QCM6490 and SM7325 and SC7280 with non-CrOS firmware (maybe some WoA
> > devices?) are supposed to use qcom,qcm6490-lpassaudiocc then? Is this
> > what is intended?
> >=20
>
> Sorry for the very late response on this thread, On QCM6490-IPD and=20
> QCS690-RB3Gen2 boards, will require only reset functionality for Low=20
> Power Audio subsystem and other clock controller functionality is not=20
> supported from HLOS, as LPASS firmware takes care of it.
> Hence added new compatible to support only resets.

Hi Taniya,

My question was more if the *qcm6490* compatible should then also be
used on regular SM7325 devices for example since they'll reuse
sc7280.dtsi just like qc[ms]6490.

And also Windows-on-ARM SC7280 devices presumably have these clocks
locked behind the LPASS firmware so then also such a device would use
the qcm6490 compatible?

Regards
Luca

>
> > Regards
> > Luca
> >=20
> >>
> >>     power-domains:
> >>       maxItems: 1
> >> --
> >> 2.17.1
> >=20

