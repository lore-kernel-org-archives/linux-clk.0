Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77F23537EF
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 04:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772599107; cv=pass; b=nlx5vD9z7GYVq04rGBjRs9xyMCfkBDsp3PnRrjdMvXBsubc4zW1xuY2E0GMv8xbZeh6J6MpaLPNaMaKP71wW1byL9vh3X17SGmWBYJcW5h2iHBeJHVrcfJjqhkbTEmy898u5TbdFGCid+jziDH0roXEhHMhO/KY81FLtnbd1UZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772599107; c=relaxed/simple;
	bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElLyxTWvkLnSmsY79vV+fQcZpPEWvUoFPEPTdGUO4sK75LOH6gHGJ+bUxgTbBnqCx4sDywGvoT4jCDJyIVpqDxPzP8yGSnJ9D2b2FT2I7zohkQ+BUkJahufdourq8VawcdsZ9Cx5idQ2ghNF2zzVPU8pBf/hDlaqvzaXOBcNpKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a4PHeZ54; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4PHeZ54"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b2965d4bso2902205f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 20:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772599104; cv=none;
        d=google.com; s=arc-20240605;
        b=ZdiqEtm+idn3YaaZ+8XeAAcT00PGSjTXduQXPN9jos2z9uIS4TosxPC5kZGtWGYWFi
         6JM0nXMFy5A031LtUSnoOBeLc7Ae9q3tz6uFqP6Qd0A5hLrisO+3Edl+9jUXRVOQulV3
         Tt4gTotdP3fuZmZam7MXNvd/TJjtWmKonNJDQrykehu6YI8QyxVA3cizuvkCL+yuhYo4
         lIkxa6V9sauIO7/QP7pcvEqRShGGlqJYe7Byeui/kKOSRfBrYx8vizDAjI42wG+uNl/s
         76RHmhpwXXVbLe1/dGdJVgTxM3Z8hKH9tM58PXKobIuPt8P0YOaCwldqTriR7zz5awJB
         YoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
        fh=lcc2T68Wwjj4+h3aqMrU7e8DMDGh9D+QHNV+ZdZgMyI=;
        b=BszqdSu4IlUoQiyEQm1sYe4qKAa1Z2x3KNd0v64kPSHWoZjB306m3mxCSI2xujuy96
         6oLFO6XGTQ6WXzS/kpfgojQpLK4oeZcsEpCialri0W07X0+wLGYuF+sujY0J1Fg0yN//
         GqTwbQnIy8Tr+44Y4oGm35CoAnvLym81CLSzBfIqvwZNQ8agLBExCsn85ECV98Z82iO/
         qwDNmZlkgZIElG1yjXhvkMRGXfUV91HLCiH02Lc6dgDZKYItMstOLIQTB5iTbv65W22v
         XJVZT9gxUkt5IeRKbwSoSL9TbtGwh1cQya1iXAkY35mDIAHJ/Cbw9F+JB0qG84uq2QBv
         vmcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772599104; x=1773203904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
        b=a4PHeZ54fqu9d5dVPFbZdcYJfKNZS+n8sza8UdDwvU8W4oplBUnUD/bOWYZp0p0nZ4
         u1LAKHQE79lkTqYphT2+t3/e49W1AS19x2WUd7+bHfgEe/E3B/ppmxlX+nZIX2XfPe/n
         b7+ojlG9jM0Ofo2VjunjkP5jdv8235577BTSXAhOqVXpLoUYs4X7f8+SIatthXA/6+Pf
         pMvaHpKvauMBQWkhefcxnwmYRGG7Qy4M3RNCZU0aTW+0NVtocJaJSmw8P8+aolqnwmzG
         mho1yrTjZREPRgcePSHNq5u1HbckRqF6Vl1e0NnKm6auw2GlJ2mUy3/fjou2iDus8S0f
         wdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772599104; x=1773203904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
        b=Io5J3YpWcjM8ZXgW1Pmn/+njT9lgQ/zCJsuLxCuWlG6wZf4+WjiFO3ZpRmbaUjnBA6
         T/NYIpTQVox4K5vWRORehGyrI4tUGrBdyt1Vvky2JvwnSqDI9C0vAqTbMm1pbFCfWXhy
         VKBXWvIxJAwMjIy/J7B7PePxxQ7S4RgGF0BLZktK1JeuJybBvFFrVOFEH6NrpUXLInYw
         1AQ9CPzmpKlosVweCsjE5oY4o1om2MUHvBkQz7RIrpmyj//rQxQB/KvWcUnDbrJHyAgp
         nGXih9644I6+3r+MOLFEZFzY4D1AzZgz/Kp1LiTP0QKQQj6Jtb1BrLV3yzfyVo6tFIow
         wBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVEduTSFOS7ybY4R8Torx6w9hf2bqJHcJDC8sn29L2ruvPWlXhE8MsiYWajUGqbf13S4t3l2TMIDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXpwNR7EeoaO+XTQvpdGXjhKKtsA60sx0opdoBISEPNrPoe6Ad
	aJexnpo9EiYI3fv4DkUQANV9V6GQSMp3JalfCQnOEm8bld1Z10z7nnn8RyyuJfDKBcyAk+Nhcck
	ZLwYFR+VMBpgkDKG9UwIF1Q1wToH1+cGbYZx3BomQxQ==
X-Gm-Gg: ATEYQzxUx+HV2aZSQ/pwjdg+fun2YPzRYKNwWWPyRsKAivoy+Pf7QtuqjNSsCxTv1BN
	ZISnR5MUbc7rU4PBMiSUfyglbXTWD2CCdV0El/IM4bNaTd8LlQKv4M3YiZISBsxoFFNITRTgGZ2
	B3qrCxPc+TCHGlwy17vApWRLWXbwYSSMnpmDRn+uDe3oSMFqzMydI5m7XlB2FvL0w30hf4+RU4d
	1oVln0nsQHkcE9xdORKeMtbEp11fL29C5LpBuVWeKo9Eqbd8eJaxHC9V4mmx8NS+/V7+FmMgkEf
	/euSL/QKkx/X4OlmcA==
X-Received: by 2002:a05:6000:26cc:b0:439:bae9:6151 with SMTP id
 ffacd0b85a97d-439c80100b5mr1233744f8f.48.1772599103909; Tue, 03 Mar 2026
 20:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-3-95517393bcb2@linaro.org>
 <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org> <j46cw7ns2jvcojavsqw3f6se5zwjt6lfx7z5ahy56owtrwd27q@ufjrfwnfk453>
In-Reply-To: <j46cw7ns2jvcojavsqw3f6se5zwjt6lfx7z5ahy56owtrwd27q@ufjrfwnfk453>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 4 Mar 2026 04:38:11 +0000
X-Gm-Features: AaiRm51B2RI4RVd1gpKraSUcwk1_GGIfzTP-w_kfBb8uww1EVsubpX8PXY_AI10
Message-ID: <CACr-zFAZELW8rL2ui96G4nPDnmtxQ4X5Q47Ha4n1dF7iHcPHYw@mail.gmail.com>
Subject: Re: [PATCH v8 03/18] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Sat, 28 Feb 2026 at 07:17, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Fri, Feb 27, 2026 at 10:01:43PM +0000, Christopher Obbard wrote:
> > Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
>
> Christopher, please trim your messages. There is no point in having the
> whole original patch to be quoted if you are replying with an R-B.

Thanks for the hint, I will make sure to trim my replies in future.

Chris
