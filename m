Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49F74D2ECD
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813633; cv=none; b=ExRavSMn7kFL1bVVCPQKZhheIO5WEj/seF0YUQz0eYg5n9/6NQYZdTluVgG2EnSH6x3LMcNGkhcQpG5Ynl0ivxeH1rb5kEG1hMTIN/4RwvRDJHjArwqzvJOc0mMlI7raMtZIP1UQsqhO6d6K2RKa7pd7saCHNdnHxB6+/mysMJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813633; c=relaxed/simple;
	bh=oKxRcIJ1Y2mbOTIIbMUm0GdqFhq2jmaFZ1ZxfHdaCSg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=cGOyLbuYeH1kY/pKcRPUgGkQI5TPs2tERyENPkcDJ9oPkKPWZA6mS4ZHmZn1hULWWuyP/r01X0/FhtBeXTFqOevBfAMNlm9JJlWVQEhNSojZEaOnsfytRDAzu+RDynUoQp5Nn62SrybdE/hrwbzMOvWUgRPYlp8ebkgKA3vm6aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Tpe/+KQy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Tpe/+KQy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso4935055e9.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784813627; x=1785418427; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5IY9Ys2IasBBdDSErNzg3azv8Wm7M0zmsUTS0FxF4bw=;
        b=Tpe/+KQye9jJd9mDBb1Oe2VrQ8vguuFHIAVUqr1fnLGAc/z723nzsMO7z8FS5bGoCd
         kFAhnLmZZEnOFZ7XYCjonYPJbhMDsCSORjpVm1K7V/mcF/tQ54dckIXzaD1BRrCGLWms
         RFFTBTjvS80q8A+OyLSqFsVaRMhy9NleBTW8EleiqJvsCqxfWSb7NDIHPA4XrUlqP4qY
         AR1ziSB8r370xcnz549vwWCym6GHXFGkE2fPrn08TgcOYpuOPTmTNV7H8wgzbDIX//Jr
         wU+xmAuMjMAW7tvfBfNTSZJ2bgX7Ve1yZXbFUwlN1EJEBCsdCIiFLIEXnfdTLTcyJkeA
         GNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813627; x=1785418427;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IY9Ys2IasBBdDSErNzg3azv8Wm7M0zmsUTS0FxF4bw=;
        b=LaRjN154sgBmx0Mys7Ovvw9rNrXJ3qNH4wvPasi0D4FcZWFF+Hpvcftm5SsNGPlOad
         Qxl6f8y9bWT9+f2zHF8p0+lVaEPjeCrzoCAewz7uOV5Q0UyLMufCsYhjI5Ydkbzrvldj
         VgSADn+tEcEWW56Ra28oH4XKwiGvyprpem71nAoZZKhhYFtnOZ3Iv+o/x2rzYeiWvaCu
         ovPVo8OCEs4KUw42zaRyCoHWSvgrUvoZ5d8n0KZtJtCHdHpJJ5rKBCvYC0yzi5kgSIRi
         y9AY8yr+A4svAOnDzaaB99utNRRjyxywmLWvpSDV0Ds7Fz+EWfpECCtCG9ojDiIpbFts
         bZAA==
X-Forwarded-Encrypted: i=1; AHgh+RqekdeSf26o+NAeb5t/OJ3t2Dh1Rr4Jvjj7Lf2OSN8ImjOrjF/+XboWD/HyLuJaVOuqpRu3dRRbBPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzayj6/7fs8tQBMUZ/1MSrAuJC1KU1CNRbHjRB2b3UI60vNF8d3
	GFb3q5iciXnT8H7GSeOan1AwPtSlQuvZKYJXeuzvUgP5oPI24SR4QWByZDRB6S5GYec=
X-Gm-Gg: AR+sD10uvF+8RqrmSGTVmgDcZhfRjJS55yN9tiS+oMGf6tX780hFA9+yocWcAAo0pTu
	9k+OG49dE39rg0xFqZ+yXSrfB/dLjEgMVPdtAVy1a9gh0mxLwlTjZsMyAsgDQ4l9lW4umlC14cv
	EycBAXtCn+2U4/jPFhc5ZYDqfmmvX/Gd3+ECTa/M47IAq8N7/wHNcBnuWiYev0w51CTMkSzEW8x
	rENrEB8EDC2jpdpsBFmcZcDFRwYwPkHbx8VNAdNLbDg/+N5/SXvze9wsnlcWzJ08Ydkhb+UVs7u
	d+lRPbMO9cvL1OXRAXM0zWUdPSkFzXr5V8U5hG3XzS9DlMRJazh6VeXmioVWAtOWl/RohV2qLXR
	eu6keINBt+MJzqHX72wQ4/nmA2KbGhxqHNNpgL1OwNNQ2ghoGGTlmEHoJ9wfMvmMWdz1DnL3APK
	4JOMT30TsuuWL4sZtLSYZXoBemso9rgJjybse80+Yp3w==
X-Received: by 2002:a05:600c:3b92:b0:495:680a:ed19 with SMTP id 5b1f17b1804b1-49573d20b9emr31476725e9.32.1784813626616;
        Thu, 23 Jul 2026 06:33:46 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a63fb10sm153054095e9.13.2026.07.23.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Document Nord display
 clock controller
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:33:37 +0200
Message-Id: <178481361788.189434.2930238451899661001.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=489; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=oKxRcIJ1Y2mbOTIIbMUm0GdqFhq2jmaFZ1ZxfHdaCSg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqYhg2T1cSpTtpH+fng6Ml1Dhe6bvEEfoYCMfQx
 9xJfyYe7LuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamIYNgAKCRArRkmdfjHU
 RQ2xD/wMXuTpRlyZiYsChjv1Oc2R6Kwuk8qeNvv1OR+bGBPnqr11cQ8sKwAPoOAoMtKUvP8Qu+Q
 5xqE27UGZWASK/fCTkIagPya4+KSbIq+3FGot4P8xIWxlBM5DbF+AUyQsvbryMfiJIPkNaC+KNU
 ltiUS/Qc9O0u0pUTjEvIp+RTO17scyKFrJUyH/T98ZEQz2tHtsbFPMGb8yBlbpUAa4u6GL4+5Bd
 8JyFo5F6oig5W/AyhXyd5kMjFD/bLxPhywPaw8hINCStBsquWfWHSeLd7miP3JWKkctGpptZKK3
 7zF53444U0TQC2mJePtEv8Ipd55mNO5HQJTAeytgUe9We3sCyjYH3C36c1Ggp514+DorDozpGQC
 yq1ytw92EdqXPN7PlEeJCBVmJSPxl7rVlT9yR3j+fc06PlwJr4+hdUF8e4QAr20wJlY/pBBo3sZ
 zvNPsEop/1WeuBYiOolc8LqtMaT0hE+v+jFnkRPzD+nfG5nTNlGi8qEzR77BE7mDZeRXHmyhvUX
 kQ50uM9qgFj+oCKpaCp5c0TUXY0All3oHkzyUMeKF/efrQUelTUTPPRVj5sz8voFyFXrGvcxxyX
 N+TxeN/wNznOE+xO2pWksWHPztQ2y3xG89EAZwvz4rNxyKWB3XXvSezt4QaoZDQVRQHjYR+q1eD
 BcZk0Y2UF6bmVgw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 12:37:18 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> Add Device Tree binding documentation for the display clock controller
> on the Qualcomm Nord SoC.
> 
> The Nord platform contains two instances of the display clock controller,
> DISPCC_0 and DISPCC_1. Update the bindings to include compatible strings
> for both instances.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
