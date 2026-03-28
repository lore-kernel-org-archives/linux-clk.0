Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8479F37472D
	for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691309; cv=none; b=cJ4KhYNbX6RfZLb7fkyJCZjjDQX95dM3WzyxFtGmoqsf6B+8mGlIuY4A80aO74NiSdVpGN4JjluRA+fxanm6TcBOCrzP9rcRTgPocGVlj1IDVoy98iV6T/5bsUOZmEYusmN/jfNHYqVsCHWbHaxvgI/JPxQ+rfy+4XooihAU3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691309; c=relaxed/simple;
	bh=H0NsGRh1ZLqqimD4Zi9vPUYMg9ZH77e8pUdX2q1gGgY=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=b16TTJlW7pdfRZ3KlKX4sdiPMDL24+tjjQWj+U2wCmYeNhXLa7RiPTFHV62OSrVDh5Y2b9+XsjCJ2/U8RJj/fZpUHzkhwFb5nkzILw28bX6btsItDZ+5uyLyLWo2BjBmi7SPdtMv6K1PABhNfcrNE5QwN1W6fnNzAaZkKM79BEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXMZ+ZMl; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXMZ+ZMl"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso1855555eec.0
        for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691308; x=1775296108; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRlWsjp96tD6U6Z/Cd/j4p1pGmRJaWjFo7e47fa1C/A=;
        b=eXMZ+ZMl7sw5pk8rITM/ZHRIW9fG4x2xSaxYstxM0qXmmO/yTNlFRkkgItaLMBeox0
         H+1Bd/yh69vGmLbimCFPCigBbHa8r2/vQyAdo0VfRDRixMP/yGI0zLBt0BurAe171Fwg
         C+wTfN00pdxz5HxD6Tla7u5Cd55JzGTOz9k0bLJ7bZiH+TjA5vM9TnWr91zAYbWlDvis
         32U9bvjqzKhNKEgClnHAXdCR0+7rG60BNBvNu/Z1B/UnAplEHsyPU8f3g/vB5Wz5qSpr
         eaf/OCuNWHyFdQxxE4iFmrz/D5ope+bY4ix0qlAGWIhIIPRDRz0xOaPjgVaXjw2zT0y4
         +o6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691308; x=1775296108;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRlWsjp96tD6U6Z/Cd/j4p1pGmRJaWjFo7e47fa1C/A=;
        b=a2dHVDT0SMSC2ziHD8ff0I8CFBgNK9oZxDzyeQpeVgeHiuuuAkMEd/T6En3g0DR3ju
         aXU9gZ14Tn2LfCl62J2f8kKGInwOMudg7wGebjSn9RC3c8kWwkiWzTjxanTMNe0/8p8z
         SJGthhwCKWKU8v3O0pSJ13TX3MfN1Ow8J+ALlXtuwEXMu+2bTDkpmNZvtZpIQ9fb4zFN
         GiXn6N7WXARIY5uRc9lmAsVvuhGEG+E+pUQCl/C1MA8iAicWKGPvGxYnZOnT/LHXha54
         6SSufJSqPcAPM2ZmO9yF9CudlOw6e/uT+JaWYmNaanBzvS0G7lIBUYlsZ4i8zYZo42uN
         j5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdqc6t7RUIoHNxVoaNq1/GifxXlbS0fD3PKcntgzlZEmAYsInBGGDdCbVWrT31olZ2OaxQbVAd2I0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGt0WcASEMo9doij8F/daXUeVjuRdLzAih/aWUZi1LPAt42puA
	LQMCGHi0b1jsfehMzSCCBIJB/Jxk91KJvJmG1/RJ6eUIQwQlLM6uvDr+
X-Gm-Gg: ATEYQzzlIGxzalcDWxVvMiEvJBxPrbTSnpjKXkYe+H8iB5ARlBJ29ANP6OSrhhciThb
	Wcq7lOO7CeJ/RW/i/MFl+INEgno6YDzrG8mNmBSqWG7Bq0/JSwgaIQPqTpA22Azt/nZnFO0Tk5k
	7oG4CY0D4y6c6Wd+Mb22AdEqfVxGLXUiqc8mEKtvn0zLvBS7pu+mhtw3lLkrl+D7ohurCIKksDE
	m/e8/HCdW+ABMymdBChMLtzDbUEY3K2OuYV+795IxH3DudCfqQV2RrT6wLmhBGD7glMGa9I4sWT
	g/AaZp1OCbKbm5aWPX54TBM1/St7CLgVrjZFLRp2NJUxMxenIeCAyddHZVdeVCAOWOsor2c7Qoa
	N6FaB0PvxsOYKIQg6zRjTD83gSlp9JwopT7ExpF6UNThL/2zb2IAIfHq0+mjVACi7Km6nIeuwPp
	2vpASK4RBTe6Pm1SaDb6o9pCpG7Ts=
X-Received: by 2002:a05:7300:fb8b:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2c186dd2a0amr2428508eec.4.1774691307454;
        Sat, 28 Mar 2026 02:48:27 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm1742844eec.5.2026.03.28.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:48:26 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 17:48:24 +0800
Message-Id: <DHEBKA3QHPUT.2A9BJLPBXGQWG@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: dmaengine: Add SpacemiT K1 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
 <20260327-silkworm-of-algebraic-aurora-e9bd1c@quoll>
In-Reply-To: <20260327-silkworm-of-algebraic-aurora-e9bd1c@quoll>

On Fri Mar 27, 2026 at 3:28 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:16PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>>=20
>> Add the DMA request numbers for non-secure peripherals of the K1 SoC
>> from SpacemiT.
>>=20
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  include/dt-bindings/dma/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++=
+++++++
>
> Also, this is not a separate commit.
Could you please clarify? This patch already contains only a single file
(include/dt-bindings/dma/k3-pdma.h).

                                    - Troy
