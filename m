Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642486;
	b=Yk0zN/NjZyFX4XAxmW19oyfpEYvMalxYHSWOgVQKvKxHjSZfwtTfIpVmVcwfRmcBFLIS
	 LPQeSI0K/ig9DkODJJhXxxAnXAjk4e9l14tlOsPpxbCBnYm5PPvshAIdKT9WgMb2UL4sr
	 K/5vvZGnHzG7SRdwCGF3PyvJZ6aA21yGyrbybyt6dCHmWoAQZs/YOwwAovweJ2mssdry6
	 dBSf9GZt2+b7BX85Ioa7+CqC4MdN4LRQQW6Ih1C7K6phPdkvwyDSBhTEPn4SSMmmUcYMJ
	 bIDA0qiVgg3lZ3vRb8hvUJu4urmzLhWaVY4wp3YcURi1g/Frz7O0wXewlk6y3sFFbkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Csrc7807j+0cWIekbqjS5vryeUuz0KEVG4hhcz4IF4M=;
	b=U6GcXgy1VCg/bj4pxMTjLnFWhGN4Z5+TZMFzaJS6R59t0ZH8AmrwacxyCNb2berKb6Jj
	 KtfATWp3S9KnKD5el8WClUwdUOiHTCl0lKhKaNn0NRPwvnvP76BeVZwCfL89copRs9P91
	 ASoxU/lhQa9NtdRB2Z2R26lGDE2mPB6R2fwPocZXG1tYD+yfzG2cyjlO41iEqKwhFiygC
	 2b3LHmsmIQYetVutAFO/yBk3ZFiG+Vd+qjlz03TcGIGtRR/5WC+xNmkzGW1RKEIS1Snw6
	 0+fL2ew2HDfdvBFHRIbgLVZ2XSdaNDs3+eLqcUyeMy6W3PWJjBFuwTTbrBH6zFrrAIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dS8k2F4D;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D50606A321
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D50606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dS8k2F4D
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so371888e87.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795642484; x=1796247284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Csrc7807j+0cWIekbqjS5vryeUuz0KEVG4hhcz4IF4M=;
        b=dS8k2F4DvQC3/cgxLCPBWOV1XWpXZs0BO3OCHgGMWCYVCS1cvxa6aafhvcNPmsispj
         wfwFYca0+sFFXp5+qzLJyn5n/YBIOqmEGVV6ySTu7W0RMPETJnFEDZulIhOa2m1pUPUn
         YqPq5QK9Swtr9w+kuCB94g5i0XG57g9pd/a5+t3pnsSxqEUzvHrCd/bjAvtmVOSx4t58
         As3ygo7Q1kdfBoxziqVsq2pzpP6uubpIwJYfjZ8zqVn7uJ5iFPUxchZrX8DDYp0P5b/k
         NYittQLqPYbbNYyhiMACH3TX0Nh+DIPAL9VoKe1j4RRv1ckJyogDtTvelW3Mlknmnw51
         7lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795642484; x=1796247284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Csrc7807j+0cWIekbqjS5vryeUuz0KEVG4hhcz4IF4M=;
        b=sqkuVHtOhuXCwuq1+ttoRcdBPl4IvoSX3+QCJXA8Wnlx2QAcZ0HWDvQinuRwl6TYix
         AXELljb5eO3mgjjo8SoxV7I6i7JYoL+0OBxwuTHJq+7XTRZs06qpHW9SOLkQSeKhxVv0
         DWUNQL+zOlgc1xdpigvirR2BIgjPWOCpGrjWDywEwYFMs3MfPY+IU234Ky3OPzZ+otxd
         MO+FQJiCCVWLhpsGS3LqT4snKU5fLV5tTutdS3CryYihj7/1KAwSSdpxBWjCuMFPkgTD
         XPfhqZClavS+sSKJYHUKemOqbLIVatVMcouTWDpFWKCfo6+MeyW5irP7EJibir4a492p
         eEYQ==
X-Forwarded-Encrypted: i=1; AL+hErHZrnq8gmhqqgcaW1iM/nOh5oaoR6gy9jAH9XZxyuBWKJc5qVBzqkV0SDCJKVAeiDfbLPFBI04b09g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VXCidby7V5x4zCEs0XQTxuAvWUUT6TIR9KG1Y7d19n+IZDPs7
	10+HBbKeJYagJdEwqzf6b/MmJ6gcLFrOoyW2Y23Kp0BpLVgdkgkZ9MFhDPPrLOeC/wM=
X-Gm-Gg: AZFdTZdHsOTUBUyqgY2mpc+T6z3lhCzpLevBU6p+0GtWa5YfBia9x/LI9oLUJeSjNgu
	ovLr12U8thoI5Z2S8dhQsv1v+7ZirB+RovM4/uY9jcwjzI/pXn6S03CdCfXvgpkbqzx8LO0ah0q
	F8+7emWDgSvs77XfGx+8zxGFKJRW4YtDPW9sS76N4aNGx/Yge6U8iu3cQyTJ+2BPOCgIIy386zO
	npI2R0JU6ml+k7tXMF/PeNhUagJPcVFWOpHX0mJ7/gi9Ep7W5wYeHIoqLkuESjgQXc0vWpL6KiA
	FQG8fcVLFonVvgh7AvPwgLkyU6DH7ztS8OgSStTKlOxrkB0ZdFjAf6HR6WCSSJlvwAzRHnu88s/
	SUBzpE53wI27OxTQLGlzuMMUj08zfPurOaJtxl+4r1ZDuFYMLEXJkYMFh02WFeJGR8y8UO7XiE0
	rddYwB4wcnmviwJP+4djKqffoTLOegkfmriH1wluKeh2Op5SZsAIqv5VA0T5qctevNKWe4Qb5Qy
	8ixxykLFCzAe9CYUbJACnv3ult42TTeknK64EKYlKbTXdgJxW14+zbzOgtL1fGBxNwlSR37M8Qh
	2iphBIjjhl/okIIoS+f/2MNyn7XAxMqzY5XPTmI+V3xRs9brz4i/iWCfVNtO6ebT1hd0BSqOAm3
	BwXwRpym1mVQPIpc=
X-Received: by 2002:a05:6512:b9a:b0:5c1:7a17:6f69 with SMTP id 2adb3069b0e04-5c1bc7deba9mr7578888e87.6.1795642483852;
        Wed, 25 Nov 2026 13:34:43 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf3338fsm4845422e87.3.2026.11.25.13.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:34:43 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: Add missing post divider table sentinels
Date: Wed, 25 Nov 2026 23:34:31 +0200
Message-ID: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two Qualcomm clock drivers have post divider tables without a sentinel
entry, while the clock divider helpers walk a table until a zero
divider is found, add the missing sentinels.

Vladimir Zapolskiy (2):
  clk: qcom: camcc-sc8280xp: Add sentinels to post divider tables
  clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even post divider table

 drivers/clk/qcom/camcc-sc8280xp.c | 9 +++++++++
 drivers/clk/qcom/gcc-qdu1000.c    | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.53.0

