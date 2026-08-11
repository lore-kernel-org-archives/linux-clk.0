Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616FB368D45
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786448919; cv=none; b=bKz9BE7Ww2ptmsd9kJRPdMsx82swPldwJNb7CkJBe8yQYU/wEoOW/w4e7mpOiuSBWrq/20WTJxWGNV3RNUVT00W0WdPsSf/ryel9/Z45qMvm6jpglWgwxQPjxOc6Tv7ewkXQ98AVUV8EiqEW6H3m8Y3p1Hxv3jN5FpuFK+P0c7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786448919; c=relaxed/simple;
	bh=+otw1eq6KyhMTfaoPWbIHySEFgArc9xKFqFzMJEX5lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JY2BuZXmFOKg+FaAmnDtcTODYW77QWhr7XSzQG7Ao3FIo0/rmq6NY6TOI1EMpYfhHF7GY2UZbWY6bfZvr0BxjsGWTjAQxjxk7iNFTY9DmDbWmcDkSG5bt82IrqhywcUCqc3njlqsYA1zmg+l0RWeTtJHj8Nl7DHMZXs91ML1/Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyNnUwRc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyNnUwRc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954aff6088so25748915e9.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786448917; x=1787053717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GBaWQ2WYLq6Esgqzdu5T5UPODeDao8xF4/EzY0gw4U=;
        b=XyNnUwRcChb9TMe3kz01GW5IITe5ts8r9FCC+Whp20teKyu1qMPA4OYSB3n40cyc+h
         n0Ae6PpM57rDBuStXBk6dEBOs5lLO5fFgnhzmgJHuyqf4BquGmSjOm+LdLXLIijio55j
         RPe83bTdQXVodtCK6xidqFx+2bgpx3UZC/7gmg9jWG5kEVgizMMFN4wEEZgzsKoOh3s1
         BgrezF8qeMZaG6lRYYTNUGPIm+RMbJ81HGtFa7zNr/nroA+yqLTfB4RygZikqe/RvKBm
         m6nipX1Ip/j1xSfa6Dhi6GoN24OxqzkKsfadVxXAxUg9fKPOnbfrseEPjpiDe+1AOGVg
         VgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786448917; x=1787053717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GBaWQ2WYLq6Esgqzdu5T5UPODeDao8xF4/EzY0gw4U=;
        b=QnWLnXgHWrt/cFFWJP2nhIwO9q5aT7O84/xSi5vgWC4DmEv2Sole+uPFZcyH3KgGhM
         csdpYLp3A1cz1lyM7jWmhYtsQwzurnhuqQV8nb2qE/PexVCnj6ut8/RbWRcedex1upXr
         s8W+dSfC8TELb8Srr4Xgvg5bccPlSeBKQOMESq87SagiHobESyFQbEX3YfTsolcPk1Ty
         v+Mnb1E9CshEaoH7gcgQI2BHA4xm6whFHx8/qgyQSm5dNrUSRICewO1Mu0gT4+MOjUD5
         o9QiaoBvirxk7HT5WhuJN2mzrN5ljZl7htHGvlsYd1EzKDTa7o33mMcGhdzBgqERTB+A
         HBAw==
X-Forwarded-Encrypted: i=1; AHgh+Rr88EiV25EYk0bjhwJwArYJZrvXZdxiPTYjk5MQo/NENDP9WcHrzcsXaJg/Eqz253c3mAWRsCYIsl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqTmqv9cvDWm3OK1hDRGbkHr1uMNZxIfzySOKzTEGPKvlf8+iq
	zG3rvmyjpa7TbklECbgAqvl4Ui5d2+rN1lQMRI+FS9W6e7zP+fUyjTi6
X-Gm-Gg: AR+sD13DQdPavfP33Asb0EcrzLPJLzHL60JUgMvhd70q8QKqzu2XiM1PCcfJGqYctGO
	gUGMBnvVoyeN0ttBXtlcV6cAhPkqNkwvGd4aLiuUprwhfx5l/26J1dLH9NOOH0nc2xPRIuRsMXo
	I522vbvtTrSCLaMHa6JfJgxnaLnnr9BwR7r7HzaZeE4Y8z3+9o8gmzGmd2vMWnnZxUPmbJrNJhM
	orfomVw4cVIZebKVWv7aK9LdUY4nNV8yypPwXl9U/jWv2d3K/Om9wZfery2qA3YsH9xONV1CUwe
	ivKcBYDJ46ACkb5oNb/L1oWMlMTCe/M3pfXqzQS57Se6G6rmhgGCahODZRhzfzmTKvDPEr4u1Pc
	NfDSFVuiNhIX4b3LVsuKbw313hK4lgzJRTIX+/g2qb/6Qpu30QTUeFRT62JRLHuUFFDMFYJyX1E
	UqXLHMJFS8e07IpYCoPV5H3TBDKH0ZpfazNazL/L8Zbo9ZLCgNLc8b+kWfflvyfbcsuJbW7g6f9
	ro2eVvZLeVpO4OTRMi1mQ==
X-Received: by 2002:a05:600c:c4b7:b0:499:4d4a:4990 with SMTP id 5b1f17b1804b1-4997840200bmr41295815e9.3.1786448916394;
        Tue, 11 Aug 2026 04:48:36 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:cc3:6030:41cd:1906:c1cf:983a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a716833sm3403105f8f.28.2026.08.11.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 04:48:35 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Jie Luo <jie.luo@oss.qualcomm.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Georg Seema <georgseema@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Tue, 11 Aug 2026 13:48:31 +0200
Message-ID: <20260811114831.85417-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805193638.15327-1-kuncy7@gmail.com>
References: <20260805193638.15327-1-kuncy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recording a tag that came in off-list, so it does not get lost: a second
user hit the same hang independently, on a board neither I nor anyone in
this thread has touched.

Georg Seema is bringing up a Cudy P5 (also IPQ5018). Without this patch
the board hangs during boot; with it applied it boots reliably. He found
the patch on his own while debugging that hang, and gave the tag on the
OpenWrt pull request that carries it:

  https://github.com/openwrt/openwrt/pull/24653

Tested-by: Georg Seema <georgseema@gmail.com>

That makes three IPQ5018 boards from three vendors - TP-Link Archer AX55
v1, GL.iNet GL-B3000 and Cudy P5 - where gating the CMN block bus clocks
after probe kills the boot, and holding the reference fixes it.

I am not repeating the earlier arguments here. The bisection of the
fatal access is still on my list and I will come back with v4 and a
corrected explanation once I have named the register and the code path,
rather than before.

Thanks,
Stanislaw
