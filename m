Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569911F7916
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165318; cv=none; b=doVtQXeYlQ+icAcnkXQRkk3QHcPV/tMRTziLudzv1lEU4R7tVAMOueEx3doTbFccvkfrgOpFI0Out4zo82cl1EoL/SOygXpYD66zFPxbT4Vo2pDut8cWDGGVpiqRBhTcD5+viAsblED0Z2aBXbzaL7zfT/fSYTQfAydWG7IQJ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165318; c=relaxed/simple;
	bh=YR6Gb0FwXaJXKuMRwNlLbb7mMb3G+V3mgOaBnojVytk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aYd13C7AcUWNR4Q/V2QOafSFYzGdH4RlAP5ugIjQptIot2hRg4dULdHXrMZ35fY8HnabYAxkiiqjynfJoI9xfmFS+zj06Ml9RUBIeH3Nlul5rRNWB/KEgn7jjSKcjJnbduoawKySnqvq0WCDm97fUrk0bnHPD22ZeJWlQYVlkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Byqlwm+n; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Byqlwm+n"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47362928f65so2704651f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785165315; x=1785770115; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mcPSzkAooiTjREtERSNa+N36b7IKMKBSaMciJbx1iok=;
        b=Byqlwm+ndqM0Lw9iRHydmPqH/EzaPOQWCll8MqbvsZMNK8FZ0J1iRKnkIYbhjhSTWd
         Jd4wARUGZ092kDPhLXmsOvrDZ3J4Z2I9ZACcT/OE4jpJl2Q4vy/h0pDmtBtN5+yKV/v7
         jwyo1ooi19FkH2RUvE1X1pCoS2m+yDbDivgp+Wg6Y2GiUuWc8NcLxoeEKwTsB9HZlboD
         IX4r25ciAq8jw0WHSjxb4FGRl+feEiyNXupN3xsBe+oj2FNkugdSfwqOKt+7T2kucU93
         XExC8In7SGW0B63/SplKF3T6rWurBObidkNBhh/HrntKdeewjVrdYhrsDPFU73VQfTZ2
         v+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165315; x=1785770115;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcPSzkAooiTjREtERSNa+N36b7IKMKBSaMciJbx1iok=;
        b=D5eZ577uGmwRYPFlrJsgGZBhfytMFrRfdVOaY47anzt0APvdTta2upZJzyIIVa1VOA
         83DfBasS54kh65ULt0rFLupUiqOHM/mEr5JrxeN0gPj+aaQEFPeYcK3ZgTxxilp5FMDP
         nGYqorSxV5qRt6PhcgoOCCxEszq0fZIwKRjj4YfHN+O3EunSS9hY/tZ9VnQfKJCA5w7Y
         aGla8oevho163xT7jPDMlfvHrhFU/7cQAa2cMT29a/jPBaBHVraoco91nGsSRtTkQZRl
         MU9H4O/p627JJ+51HMhHYRhvoEjKZ7JqUAF9nD2VQ9NCgH6GYCp8oVrRTO7AaEcma7JO
         4VxA==
X-Forwarded-Encrypted: i=1; AHgh+RouQYl8+7DAlP6S+x/+jUaISwkvsQZODbFskPBHX3xJXTsaq6PZs0VHaAaZeDFKDfmYWul+7lUA2rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoDQ7aGrAmxwLE9NMWVH0pA82gndw/HKpQJKoJ3K2ZvYFUAP58
	8EnLIrCYc/smcp9Rm1KhAi59XsrQBnhMHMTXjpniYqF6YNCD2PjKJNwZNIB09v08C3Y=
X-Gm-Gg: AR+sD10onOxDVPVJ8+RgKMKcxbBn0mwoLmG2XxVLF0wGc1JM9ZvsbBeiSn8CYk49Vqt
	PHvO/rHLxLIRl/Jf3urY6iP7mPyr7kMk7M4X1uk7py8tBjR6ABxAt+OiyRmeZba6B6qlINO8pyV
	z8rnqlzkz5UdyZWlkGYjNm8XW7dGpIF8NRQ/0MLT3LI4nWI3aq9tf4Ffy6vmwRQ8bYIoYdfg9uK
	CRaXM0OeRlviO1eVFhEoHtDiCwLR9+w4qXuu4A1DAjHq9gmPtD66M8xDCpNnc0ImcYo62K6QTGr
	sqSxxDvWFPI7+ETKw//JYsmrSu64rw0kkauVf+7Ledrvny33/08S9Ng4Z2cZ7leCBVViUVut86G
	Lwu6Xwuov1QySVWUXjRuXo414EgI4KvjsAeraux/1wRy+DnpdOm6ksL2Vunh55G8oOoHCdu9I/O
	sEFbFfKswA1Vaaiv9Z+QV/ub6TrYUvqMVs5D6JPjcuQg==
X-Received: by 2002:a5d:59a6:0:b0:47f:87f9:6d06 with SMTP id ffacd0b85a97d-47f9fec332cmr12271873f8f.61.1785165315467;
        Mon, 27 Jul 2026 08:15:15 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm46580760f8f.10.2026.07.27.08.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 5/6] dt-bindings: clock: qcom: Document Nord GPU
 clock controllers
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
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260724-nords_mm_v1-v3-5-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-5-32b45232217f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 17:15:05 +0200
Message-Id: <178516530503.342148.14086284982574726669.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=455; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YR6Gb0FwXaJXKuMRwNlLbb7mMb3G+V3mgOaBnojVytk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqZ3X+kr9MJGSM70ASLoPwps4OdWz+npSoS1qbl
 uyWZbziyp6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamd1/gAKCRArRkmdfjHU
 RX7BD/99/Dzvrhsiw7SoR4khTznSBGBRF9jRX7tiwbrqDDgO5UbQ0Ut5SCKHPFD27vvy3zDS1V2
 N7WHA+heQBJPQZR+529/08QLXXYj5VdGIFV1wPEqV8hRp6PX+VYz7w8McLjXjJScMnYmODqldOy
 9OW+LJCPUGGZcPLxNGO6e1h8tM8LuLofRJkWPqNDrqyHoVA4ghdNHKBQ1JGkN4CHiCRY4Y4b3TW
 /ZE/ybcSRyN3STtR22NlTHQ3Ift1E43QV2aCRa0ckfl9MxqBJ/2NaK10UFDmi0LBze+ubyEIk/l
 5l0ikI8i4o3MWCIJ3KtU6B0ZjnvWQOho0s4DnWBLGMNZNYLYaLI6uT80nauSS4fgVONTSl4cxY8
 ha/flSZvbZLl1KuEe4yn+ILAEk6nVHP8rKhW1cmEhAqdjfk5ZG+xcjqFr/B6FNpzDtb/FNHl4jO
 696a0gtYG8CoiNbIcLk7S9SX7Nn9J8zhl+hi7LH71E5ZI/zNfnz93h/BEEdGnWvexrwMg2CpIiD
 h/tIPdz2/R5etwPhNYzpcH/VoltOaIBxGaEe+o+xonYBFS1uFFR0ScdNg+oOQOpceA2NBL39sC1
 dyanS6Dq8SXZtLIGcuOvCheyVJejTGrgzjcP0O7irOt3CQUcYsIx3Eqe1KQJlSajTWqZ86ONEg2
 TSx2rRJQPsJ8N2Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Fri, 24 Jul 2026 16:25:09 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> Add Device Tree binding documentation for the GPU clock controllers
> on the Qualcomm Nord platform.
> 
> The platform includes two GPU clock controller instances, GPUCC and
> GPU2CC. Document the compatible strings for both controllers.
> 
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
