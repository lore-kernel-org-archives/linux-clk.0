Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E42C325C
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037277; cv=none; b=DauwNYo0XVgmgPZ8X2fNotdc7+G1IKYFd9D/xac0YAncU9C37pqe8cIE2jggBXQaHvgzHdBFuT3i1inor0IbFQuVrGpEWauGcyBSujGtHwdfvMEHfdeNqydL5IZaYOxYcjBBJudf1/fBm0LypxYBrp8MpBcoN7Wr7alPcprYt+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037277; c=relaxed/simple;
	bh=9xXvH/B+/8ovxyiaGuMlHCWofUTZqieLqJyknmO4BWc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g6vrFllj1jktPwBthsAPqBhIhSa6VLxIGlkFgK6gaspV5uj+Va5epzJNO3ZJy+HbeQiaeXwvQpO0Q53BgTSW51YYJG5UCcR9S/GTw488bYY5AaK6zwmy67r3fr+HbQmqhdQt9OBIBbtWc0hqUfz2ir/Hei4m0BqpqnsE43LAsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I2YkeXsc; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I2YkeXsc"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so3711571a12.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751037274; x=1751642074; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YdwBq8x/9yTkh9TL6YeeP2ANBhnQ2yJ1UlsY3OJMpQ=;
        b=I2YkeXscYPiN5DOWsol9nyFJ1uwD/uU109bB+OU8zaelyHH2VWoPjPmrhpNIw8Feff
         +TYD95Q4jwbMd8jh5wC+f8tZ4P2kW7cKtHtDq2q3oZW6uLy+i7BC/ihEBlJbPeRWG1YJ
         ZHVr2VXNytYyN3YvjxAKj4+2HJWy+hmsb9qhj1jglrigO40T1ABM8VhfX61Bb/9eowtd
         oNjj3LTj4IdICvQHQ7s40CBDMh8geJsuoT0XTIFV/yflmcZFW/OINt59Ez4JfuAP9CdL
         JjN8CyWCMPYbBHu1VrRPe0UsX4TnPbxGHzjzhzN6P6rD/3E4O88bJslKCmKbf1jp1kUk
         Qn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037274; x=1751642074;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4YdwBq8x/9yTkh9TL6YeeP2ANBhnQ2yJ1UlsY3OJMpQ=;
        b=wtM5B+uGOfKBTjMD5rV3DGYQ2RLXEUoyzkBf3kGNsCyIfROYo9OoiKF3VkVJ2bK7gp
         qpe9pipc52nPc6nBlG1YKhOY+JJTVGFH3DkBgW/c45OrqxzqFN3/CAdcslJoE20iNGoo
         xSobFIU+3xv4D/4QPqr/pfbvpPpXa4J9ggF6cLEuf5v7xlKu6ErWGBfFMnWh4Q5B3Wu4
         4kOFRmcwP/64GGocn6vsFt5RUofbCRSOoPyqTTeZxdE2Q1azgM3cGRYAj0EblbikG8Io
         JAq2B9obrrmdq/j59WoNuMYZqfIZB2uSP96CPlwcY32USw8Qnmpevn/YBlEPQ5egKdcV
         lQPg==
X-Forwarded-Encrypted: i=1; AJvYcCWigHxI72IiiYwaN8yxEV3rOPwC5saJ33ot40sel0syAXORFVfnC1UuG5QBB0wsVV8BrKWue9JjQVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9VoHFc7hvP5+mlP+vOGzTMQF+m4lM+roL1jRK5xItz6VNg1PH
	Mpa4XTwvEgVLn30euUWzR1RwUWej9lSLiIbIjSZoIOs/X8MTh8Sp5Obb3oISmahtCkA=
X-Gm-Gg: ASbGncse90ne3y7P4eSrQQJFst+c4fUDQDz7KmiceDZic2ZjmxXy7CZg9vGMw+zvD/w
	XVseU8PHHSZh/DywY3USTSnD2ArnN+dLcIbcC/5rCgX4Xe5lEpHBvrx7a5MQl6KJn4dJZg/ejoW
	ahHPswKbYziJNmESqv14MV7ckbHY/ISELBc/gNPLiyeyJpeAnVnI9bl3tk5aQ6xZwYJgQzmrDKn
	Rxir1KpJL0q9YDCWghymHwBJ6nvxxI96PE85C8eFxobv8mHOBF8T1gYCO2dP11mDAQA7BYE5zl4
	KYh9l9E9bW5RK+eGbtFsrnqWbBhATnDeRr143d5z05F4e5+QvBn/aADdmKq7FQZuvk8v0LI4uRi
	Z0/4ldVqDdiQpQ+V8FXnzPCtzdUF3CM0=
X-Google-Smtp-Source: AGHT+IGXK10sOdRHQiQDlGMMOAu00b6+1HTHgeTGZsSXRorQQ5K4SHjAIMDlViazK5Rw9QI+EWq3mQ==
X-Received: by 2002:a05:6402:2063:b0:602:36ce:d0e7 with SMTP id 4fb4d7f45d1cf-60c88dd63d7mr2289708a12.14.1751037274070;
        Fri, 27 Jun 2025 08:14:34 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bbea9sm1617466a12.1.2025.06.27.08.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 17:14:33 +0200
Message-Id: <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
In-Reply-To: <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>

On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 11:12 AM, Luca Weiss wrote:
>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
>> VIDEOCC on the SM7635 SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (10):
>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Control=
ler
>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Control=
ler
>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Contro=
ller
>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controll=
er
>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
>
> We had a massive yak shaving patchset go in this season, please move
> the magic settings in .probe to qcom_cc_driver_data {}

Okay cool, I found them
https://lore.kernel.org/linux-arm-msm/174970084192.547582.61230540758298270=
6.b4-ty@kernel.org/

>
> Konrad

