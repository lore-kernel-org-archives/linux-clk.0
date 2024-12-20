Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DCD19994F
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685428; cv=none; b=pxLDqNR4HNEaumV3BK0FoGQNC2sPn2ljoIzTy8vvtRvtg1dKeTSp3nlsYYt4lyM+GLVHGbAzVJKNgetual2zE02OyHbXUogFd8LIhVnaEs/fTW3xeMparbrX6KN7YjzxXUqxGBsDyXkkus5+kZFvAjjV5SnQ5XS8s1xKPtUQTtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685428; c=relaxed/simple;
	bh=DbfIVgwdPOtjGyPYp3zFC8cSx0e4NRwlmaO+ILtD/1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NxsmIWEs3Z9lE09tIExKA6s3ELE8v/UFp/QUPOqy9UIRaY/ce0zWkV7hEq+GauJHJpAC7cDYQo5W1w01ytIyh0/RGvlRs6elQ8t1B3t+yee3p5VvpIY4PnNPLcCzVgCEvxCHmOzRvmHOaZsTNCvJujSdy4YpS48+wnkjEfzxRWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vuWkiM2X; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vuWkiM2X"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso11306885e9.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 01:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734685425; x=1735290225; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TKQF6v9mjJTHAGrz+anbwJhJc4N1fYhnSvoLIwg6Hw4=;
        b=vuWkiM2X2LurHfl3/g+Jj7uFleBh8ZZDzDqFryqzDp9kC5QIc8gZ2WbFhc/TTsyN5x
         IZs3kh9hl0UccvbDEYBOQlMdhXagX4bHcRRIIpbJXJTN7sFNvQdDSmtaXQhTOYRfeOOz
         M4ZKV9qzuxEcw3FGFo4lOazlVpYOIrfLPFZBui5clscZelSHKo2L/PXSSuIa1Qknaf6K
         UG5DwwVxu45S4zgKRNtr7m7EfpT5X8/rjvxsgFYATcKobrG2D+935LQAUH5+Adufgl6o
         OTEuaH51tfS6q5fjpO1mnZTTH6XBgcHK3oKjQB5mT4ylM/e6BD8ldfwIbiri9Qp7VUDh
         tE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685425; x=1735290225;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKQF6v9mjJTHAGrz+anbwJhJc4N1fYhnSvoLIwg6Hw4=;
        b=ToBZCvX/akZTcgDUmy2eFoVoZoqmuMCqALT/X6ZuHEk5K6pgHXerCPVIZ6vfFeXEn/
         n6M9cBxK7E88QshJmsNHt4wMo3eR4c6Yjxe8NICKEPsjbbZy1QKxyWAEXi4oM8WfM01d
         3Yp73bx2qGgf1ABseJZ+BRUkdi2yK/jA49kIgGxSY8dZwKnnNV9p/F4YOplW2mJoNGgv
         ow9gPoVsWvoEm92jc1Cszh1E3KYQjKNm87yv3Nqjozr9VgQ4FJtApl9xI7gUR8pcQvYf
         4vzHyRb/EUe9qxUwk7lF73hVXOLAAloNyCDR68n15hu55kvQx+dIDi0/uYL8ghu+rIlW
         8UUg==
X-Forwarded-Encrypted: i=1; AJvYcCV1n1aYewHbpcWG7dXBzkPmrde1znuH2f+jAn5L5hgP5xYx+JCSeh+dMXk8i5vCp4GrzwZgjxV754U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUfLsJKsAGe96X6oBzy8RyX49LEK2K5TyXFPFU58AU2KgfO9PH
	FnRwR70vXXLlvvVuDgFnyi02YOnPViEflVDb2L1tcy2+Dw+9oByZrwuABawWWBM=
X-Gm-Gg: ASbGncv5NekXG3vx4h5R05nzdFBZsMRxEYitTbEjU8ryP4dc7zlC6qnaLFdrx0anRP8
	/ukjawP97i6bMxVGK8IP/8R+oP0hdplF4fERQ1ZO77+pBDcNHB9xSRWabPDWiLL8ic2sVlkX2lI
	If7MJ7h9TfXbijQI6HT3nEMt6q0zKtNBl6XXkpeCicnh+h3WXXP2UJs3WvK1jJb/gYw3qPmNlvS
	LUDjdPUACmxRyrZUZj8sdn6LxEaH80wm1aIdYT5+ELpfFIw/TaUeEnUcBnHHxGPzYFqpnA4Fm01
	7/RlDypanc0hC2AEI4zpXNkHMDBPwA==
X-Google-Smtp-Source: AGHT+IGSHfVV7ZgeNmbzBWx67alIxQ8s1vI3ArjQYk5K4x5dU5OensPI2MOkBdI3RPTXPnjlqYDKeg==
X-Received: by 2002:a05:600c:4f51:b0:436:1b7a:c0b4 with SMTP id 5b1f17b1804b1-4366854850emr12697055e9.1.1734685425468;
        Fri, 20 Dec 2024 01:03:45 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm40610375e9.7.2024.12.20.01.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:03:45 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add missing parent_map to clocks in SM6350 clock
 drivers
Date: Fri, 20 Dec 2024 10:03:29 +0100
Message-Id: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEyZWcC/x3MSQqAMAxA0atI1hY6OF9FRKpGzcJaGhFBeneLy
 7f4/wXGQMjQZS8EvInpdAkqz2DerdtQ0JIMWupCaS0FH5UppfA2oLvGw3oxS4PtVClbqwZS5wO
 u9PzPfojxA5EIHo1jAAAA
X-Change-ID: 20241220-sm6350-parent_map-c03e9b61a718
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

If a clk_rcg2 has a parent, it should also have parent_map defined,
otherwise we'll get a NULL pointer dereference when calling clk_set_rate
on those clocks.

Correct this on clocks in both gcc-sm6350 and dispcc-sm6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      clk: qcom: gcc-sm6350: Add missing parent_map for two clocks
      clk: qcom: dispcc-sm6350: Add missing parent_map for a clock

 drivers/clk/qcom/dispcc-sm6350.c |  7 +++----
 drivers/clk/qcom/gcc-sm6350.c    | 22 ++++++++++++++--------
 2 files changed, 17 insertions(+), 12 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241220-sm6350-parent_map-c03e9b61a718

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

