Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76DF17997D
	for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721992725; cv=none; b=A5BgiXyBgEVf5F88MEWNcBgLy0cvWZVH5KdK9fYB6DDsj5KTFxlctgj/wkaNPdGKuhHIgaql2CYbVtYFjzPQEKGHtjFRDkCTzCGMjfRS5Z5G4ouxlJjFt04uR6QBUposKqVQg0jF/jerNxa80EPiD5fH8ZLRXwDTX6b5RU2/tgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721992725; c=relaxed/simple;
	bh=ckCyUrhBgaUj/zbznCBeQ3fcpP9VdQ8U2iRFPANaIoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWmIgNLsram4Ca+1todP35XNDpcD4A2wJ/Ho0725EbhtLiuFIUiFmWUD+NOd92YpJQQ7eUEoe6kv7bcmImUjv9a8BEMpNMNCtuPWJWQ5i7QKX+lK+Is7DR2aYk0EXVB+btefkHk5OmWUWARW84e8UeIaM5nkVcAJR7DCQOjblh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RcNbaqxE; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcNbaqxE"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso2602156a12.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721992721; x=1722597521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RSSre3AYsx9Ck3+Gf7pgOKZ6yzR7bvdD8OyLOsFucA=;
        b=RcNbaqxE96dT6dUfpN/AmHwMUvGYabTuZapJPSaoDjuT1HF4TTeVQMhBkHKiUcSU+Q
         Kq68ZCSghMcj+pbzBNRB1RF3GcH9pr8jflXKsDHuo/ZEdAKkGi+0Nhl54QU5OecPQHca
         s2345mkGVXGpvnKIw+vNDPUHOqPgvRjfmQN8K6U3PTljXDt9SlC7D4TJiJKuvO5foc3p
         WhvAKL4Y06YqOdm+Ozloq5bscxFLl6hE005hMp0PdEreqIWyVPF/WZZNrn5/Sd1Wc99g
         oSDS3APN6Xt6STm8fxYomNqobWnPRoq4YBf5n6Ohl7axHJBL0p9B5RehON8MFJvq3yRX
         ec2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721992721; x=1722597521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RSSre3AYsx9Ck3+Gf7pgOKZ6yzR7bvdD8OyLOsFucA=;
        b=T9uRfe2F5PKUkjIksCblZsA4K3A2nffjPegs/EBb8hmnojkERxWi9vgrsvpwldgEAf
         wGNPxmAqEv6i3w9dqhAqn2nX526rkIZz0zG5cqcSV+7B6IEJCIXTmY7e+TPx3+BhyCa/
         nrZMzLVxbQSA7IWvimXX2y/O/a5TZDQF0nLS/68tlmVY6LIX0otqXjfQQC83j1oBBjXU
         GYOsVQglCBiiGRXF0jvmMjJ+zSWNOq+HMWJHRrWonTbZPovJI1rCzYHX1JGFsMHkjgAp
         KClii9gNQt3Yq+Q4cR4gff9R5lLjjnFxbeWZB/5p7e0rnCjRo1XtGleQGzf/cLcV67RT
         Txbw==
X-Forwarded-Encrypted: i=1; AJvYcCUUXFqlcxqUezWJ63ebU12IP1FuFUuQ2Jedg8VoVU03Ia8mLTb+PR/HIiHl3ku8Oz+Nb/i84P4UWm1HsTtwJRaqWSYsrx8KrWRK
X-Gm-Message-State: AOJu0YyOZC/8tADwKCOkB/01HuAbNxjI4iscfX/jgvxq/hKFvuF7vax5
	woJUW6j82k+6gM8SwYJF/+ZihQrpQ2ByEYEEPk0zZIegKtgdAYiGa0IyxLTWbQE=
X-Google-Smtp-Source: AGHT+IGedxxg/izaM1e+VztqZWQWxkaWXqj8R3F912/FfkJgI46WkcgQ7+j+9WvvDIum0fdm0GHjIw==
X-Received: by 2002:a17:907:6d01:b0:a7a:a0c9:124e with SMTP id a640c23a62f3a-a7ac4daffe8mr483108366b.4.1721992720735;
        Fri, 26 Jul 2024 04:18:40 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab233aasm164703166b.8.2024.07.26.04.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 04:18:40 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
X-Google-Original-From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 26 Jul 2024 13:18:23 +0200
Subject: [PATCH 1/3] mailmap: Add an entry for Konrad Dybcio
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-topic-konrad_email-v1-1-f94665da2919@kernel.org>
References: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
In-Reply-To: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721992717; l=857;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=ckCyUrhBgaUj/zbznCBeQ3fcpP9VdQ8U2iRFPANaIoI=;
 b=CNtGakN4VUWxmqa0J8qCXm3ryhK2xBygjVnd3sLEs1hjjigxFk6KXgVO8RguVUgvC2vrvozQN
 0TFoswoCFN/Bf5JR+kUjCYQ/6OyAUzfDbdzncCFa0m34zezBQ43DbYf
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Map my old addresses.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index e51d76df75c2..d189c6424697 100644
--- a/.mailmap
+++ b/.mailmap
@@ -353,6 +353,8 @@ Kenneth Westfield <quic_kwestfie@quicinc.com> <kwestfie@codeaurora.org>
 Kiran Gunda <quic_kgunda@quicinc.com> <kgunda@codeaurora.org>
 Kirill Tkhai <tkhai@ya.ru> <ktkhai@virtuozzo.com>
 Kishon Vijay Abraham I <kishon@kernel.org> <kishon@ti.com>
+Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@linaro.org>
+Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@somainline.org>
 Konstantin Khlebnikov <koct9i@gmail.com> <khlebnikov@yandex-team.ru>
 Konstantin Khlebnikov <koct9i@gmail.com> <k.khlebnikov@samsung.com>
 Koushik <raghavendra.koushik@neterion.com>

-- 
2.45.2

