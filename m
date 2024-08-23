Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB00B189BB4
	for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427535; cv=none; b=CYJx7J974daIHW9qwWPgzbe74m6do/3nj01MjHsh3h836Pvv26tQ/eqgjBI0Ycgmh9AIjUqQqktgsPBO64YBLd35otpKbyFCnJ3J7KO1ICZk1FmN0DzvrIMd6S7xBimvg2S92gMfOBKp7sXuSgYlce9FB2BzyUIOrCbfDAfdJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427535; c=relaxed/simple;
	bh=I1SOWiIGPu6vY2GBisGqQLn9Gw/7zARxAsMqXEON4rU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GlcG3cOxQ6v3Z0CtRSuGP7Jo3ZFmpaanU6wiLGLX1tkIuzWSB79EHT0n8I07q54n1asfe5KO9+6/wfKa2Z6L+ewmjajf4V1zzng7t84XHa+ZSQNFIoJ7ZcWcciqKapG8taO3jdy64VkbSLnm+wpDrzqamU8EuVPJGVLI8Erz8OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGrb7kF5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGrb7kF5"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86a2fb30aaso4776866b.3
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724427532; x=1725032332; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02t30s/ybPllnLA3TyUJSbU8BgvNyPfDBBck1hFXkxk=;
        b=nGrb7kF5Abymgbn+PvfdUU/iEcgTrUWk9Tzuzvq58xrUEJqmJncdiRntA3sEl9N5/q
         3sRLHdiIV2TwXEhWRbD2aLojAFoSOuvfzcVUWqmEYw64KQBi970lm3YeVSAlBqIU/bE4
         VOvFP3ZJKI1rUQ3pxUJvDTHun+NG7Cxn8xBJmXw9WolMUKs90lJ2a3cJGi7a6m7nz2L+
         QPqoM+6Y/dsMFmukWqF1jaTQ1KNNr9LooR34FysFmxTliAmFqh5pD0XnD6J2uK+2/FbA
         wXiCehPg7HJZOWrmzzNR9iVEmuh2NM6NR3U+nP9prBcs0N2I57/xMeqURaUAmaLwhRex
         mqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427532; x=1725032332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02t30s/ybPllnLA3TyUJSbU8BgvNyPfDBBck1hFXkxk=;
        b=uGsFgR45UHL40PhkeQxQq3nZn1ypc0BNYfCXaZXVyxZcC+t3e5tnfjU/uLIxW3/6yC
         Yp0cMacHRCFdLrU4UTqbpKdqyhesSzhqcsRLSgxbovRrUd4XDM/JrOfmpq7RxbgWAeLT
         1UnjK8FQPvsAkptx+tN5YWLszS0Sph9UwjjTxzHEn2X9kl6n0AWRO1WRNJBMItCGjDTq
         /N6Mdnqef13wjyYE0ATVAbssplVu0mtX6VbyAVMER+gFigovHLBa3Mv2hSTewMVn0Xt0
         DzMArd8BeBD1/lKDCAncQk/7U4w5T9/2lLdmLKtJhvn53qpFnc+0pRSjQG84L4uD0ohe
         0g7g==
X-Forwarded-Encrypted: i=1; AJvYcCVkNlu+tOWqIRyFz2wbOv9bxbCKNqk7CuG+rJoaryKg9fkcuXlGQ7MV4x0gbDn00Hmx5KImb20pwK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6fzuDqFzSywHV/SRJFEOnBz+glEeIUd2ZPmGE+urxXvbX5bGC
	tznx5hYrSOCrf5hzbelpNMl8mse8sQamsQzkMYfEi9wdTb5Fpi3tvShyLZyIQ9I=
X-Google-Smtp-Source: AGHT+IF+oQ/oTjHRbmUr6WGmP63IA5idFyALrsMFoNHmXhsK4HxGj6ZLMO2u1Ea+dVgRNa7oqKaM/Q==
X-Received: by 2002:a17:907:daa:b0:a80:79ff:6aa9 with SMTP id a640c23a62f3a-a86a54bbc5bmr95455266b.8.1724427532157;
        Fri, 23 Aug 2024 08:38:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2e6722sm273279866b.91.2024.08.23.08.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:38:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] clk: qcom: simplify locking with guard()
Date: Fri, 23 Aug 2024 17:38:42 +0200
Message-Id: <20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKtyGYC/x3MQQ5AMBBA0avIrE0ySkpcRSyqBhMUbYhE3F1j+
 Rb/PxDYCweokwc8XxJkcxFZmoCdjBsZpY8GRaqgSuVoFzbu3HHC8TS+j57xsNuKypRaE1HXFRp
 ivnse5P7XTfu+H33wRfxqAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=756;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=I1SOWiIGPu6vY2GBisGqQLn9Gw/7zARxAsMqXEON4rU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyK0E5oVO76GQ4lUsSKXTyKg1q37ZGutvV4lFI
 V+OGz6MhTWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsitBAAKCRDBN2bmhouD
 19aFD/9DTXsgKVzm38+yVPk+FF8ijkYsQKdKmnee/5f0/gF+z6P+LBvcQwDIJTa/prG94BHl85l
 3+GvXg67LWC4U/9ygi72U1nB5KZM7r7+TPc8tRAxzt+jHWLdoCUNU94hcRez03387xuTKLssBcf
 q87PEFVUsNTLzDkMfMUhnymwte6/qCyTJSsVdg4ZgfhXdKKe3oae46R7O3VoIUHEeXOF39Q+I9d
 wAYz1YR6w9kER9BZGVw1i4hnYNCliFItXJnSBgAbR4qBNDNUXj+oTYeYGD70/kiU7z9bJd255jH
 B4zJBgLidZXNSWgGokwqPY14MZwMc/tiGFGuSMouh5iBW2+p4YB8oh4VSxb6osFQl8bCzZVgdO4
 kpHqMZ1lJOpiEjtfY5yUir+QEYV/FPoPuDLDQGvv9xoATTA5JCW9qOH4fwuEgl3rQF60z+YbhPi
 VVQ41j1gc2+/VllinXNCrk9v28V+c7DIO08/yKa1fYXUTE5zuHYIFZweORu41PLT3RuteyCO6C8
 3S78nTt97MZsacqPjNXtRkcVXQZkCEYxp4c2HG640qj7y9mlKlpt+s2bbwZMSWWYCFJv3/VSXPu
 r96ykj8aa0B5Eo/N8R4/2sPLIpZtoRFh7eYNQf6Ocjmy4DQMteaReNV1JXgLvzYC4jPOTyCjpKW
 0LRWTPeyzr+sLNQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling around locks with guard().  Less gotos needed.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      clk: qcom: rpm: simplify locking with guard()
      clk: qcom: smd-rpm: simplify locking with guard()
      clk: qcom: spmi-pmic-div: simplify locking with guard()

 drivers/clk/qcom/clk-rpm.c           | 27 +++++++++++----------------
 drivers/clk/qcom/clk-smd-rpm.c       | 25 ++++++++++---------------
 drivers/clk/qcom/clk-spmi-pmic-div.c | 13 +++++--------
 3 files changed, 26 insertions(+), 39 deletions(-)
---
base-commit: e188fd67a69319f3d105d9b90e424b8d1ff9580c
change-id: 20240823-cleanup-h-guard-clk-qcom-2a766000bb46

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

