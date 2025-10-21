Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26D4350A38
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 23:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090318; cv=none; b=hMydFxijfClEnQ5LZ60TlLiJHSsgxtTNIXPLEsIP5+ckzyi1kiwaQ+MydIH1yKJNKrMNoM17GR2+2JclwqwcwJSoepaJwERqeOrD9QNhjZmhTiYlBq6KdHpyRs8gsFONh5JaoZHp0Sq1PpWD0dZmJ0+0vHQM7zGieGfZP2/Xz/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090318; c=relaxed/simple;
	bh=CG2fj2agGiYEv+VKfbErKVJafcLsg0MfoHn5vJsFu0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XlxjTWWGaL2H00d5z01MNjzX8PrHcoTT6R7khEIIHP+IXOhXB3UUNMjaWSxnNHda7Oe5KR8xDO/oRFGNJHQBwilmOMPSN8+kI3ebywAwXPjHJcXMQa5Ld4bac/W8jorntnbKfONNbEc8sYVQAZ1gENp/DirWNO508nT4CQpXG+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uArbDuZd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uArbDuZd"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57b35d221e2so1581869e87.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 16:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090314; x=1761695114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXNzqEwyvYqnZn04rAmeK03nKv9T3yBVcqRQH6EexXc=;
        b=uArbDuZdQaOAn9hQA2Iw6mo9Ds6W/whgOIVBqZa1phnQydfk3MwDFNYtRsfJeAyNNh
         +PJfYdWHY+mJrVQzXxxXZfujOiQMSlQO7s74RVXc4b6MgpL1PvDIXwM7HXeFwNgTSyO3
         2TuE/jTb5EN2YGwNakYB0yzcGWn0OxsHttIQZ8B2b36LpJZkP3rkNWjHuGFEutrs2bjH
         zHiajdW2nU9z0kxvjK8NXwUdkM7WoMKw1QMfxUwgrtiJmgrz9WUWsat+uSoyB+pfqwij
         BinDBKnwm/c1PIx5q+cnIS/ER+YAVsPquNGpzB1T+mTrrKSDdCHx75OBizjESpC1+N1b
         Y76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090314; x=1761695114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXNzqEwyvYqnZn04rAmeK03nKv9T3yBVcqRQH6EexXc=;
        b=r+AgFhOeiyEp48H4753zbhW2Lc4gAHH5TH+JqfMMw3ieMcJO2DA2LKVi5/144FHk4C
         pwWGDFH2XfD163X13whH9fkInkhyjyE5DPlhiJFF9tc8DLlEQhbhIAao06s2zewoxWee
         8tZYdEaTXq66w/RlVErXkcSFrdrIFENptOptMr0IWRW1Kn2vECtmhZeKJev6/VI9+0Q6
         G4lVFYHRDSoT4vsDWnHqweST6gHz7uyQlvb/nU1KjfyGGi+gxOk0DW8TjB7C4RN2ZaI2
         0CXc8zr5TWOm+wBgsA+oAEOoOHD0SXOPbvh2KePW8T4ek4GLVc8+L2j4Du8A/hd9QMhC
         Kt9g==
X-Forwarded-Encrypted: i=1; AJvYcCVi4bhR4XZJTSA1zI62E26mTtmVSEve05HblNYtrnOw9X2+mOyS2kWdhyseIaU4RuVZJTumLsAhoTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQeCygIsJKV52O8KTcvim1OfNnS+VpxOHlgEAft3xm2PDUFIn
	FKgWk/qGGJwEd6bVv/i9tPtDg+ktxYHfyukmvbSy4g4/ObX/HC/Qi5Yk8BVasSB9Fzs=
X-Gm-Gg: ASbGnctOJbxjhlMnAHfIwiew/FTSO5euqLAzjgvU6sB6m6EI0llISuSbs+TarcBiNlm
	LZdrcbgAjBgmr5DIpEB6ZncNzzKWCRxXzFSRsvMvGKtAJmy0KdJB/tVd8anlQdVjvg/RbzHyHbO
	13xC7cPkoe+kpIjj01+kZ+SkhKsDcaJsyGhsDTXbylReKqUd0p2YzJTdiiduPJDvUUaYqkyAwv9
	5/qC6GSuE1mJ1i+yf1kwWtDky21eLn2ywpndIe/kJH+cGmQS8WSGhL1riAkY4TnAXGjZA3O3+rr
	Ypr7eVp3Ec6JiNC+xp1ak3rZueqtFXq6Y50Ws6c3JZKqjk++IPAR5r3T0CabDz3G/1eq2e5ufpO
	PSyieK6dY14ClOv7BDcYkidUD0bTvahKn0Fqmd6xtctTMukdd1RvxGa6lnvbb3l+Vj08MPVJ1xm
	+ZVFm67ARw5XHWmfSQ6IivsvBjuRYYqVMTpL2yqinLvC4=
X-Google-Smtp-Source: AGHT+IGnZwmTxu8wfMbgMZ/9IeVP05UhNFnptgFg9AIRjzkpILf4FE8wwl4LMnFdSkeVEZgUJgYRcA==
X-Received: by 2002:a05:6512:308d:b0:55f:6637:78f with SMTP id 2adb3069b0e04-591ea31cd1cmr815372e87.9.1761090313555;
        Tue, 21 Oct 2025 16:45:13 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:12 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/6] clk: qcom: camcc: Specify Titan GDSC power domain as a parent to other ones
Date: Wed, 22 Oct 2025 02:44:44 +0300
Message-ID: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a consumer turns on/off a power domain dependent on another power
domain in hardware, the parent power domain shall be turned on/off by
the power domain provider as well, and to get it the power domain hardware
hierarchy shall be described in the CAMCC driver.

Establish the power domain hierarchy with a Titan GDSC set as a parent of
other GDSC power domains provided by the SDM845 camera clock controller.

Changes from v1 to v2:
* updated commit messages per ask from Bjorn,
* added all collected Reviewed-by tags (Konrad, Imran, Bryan),
* Fixes tag is set only to the changes, which are functional fixes in upstream.

Link to v1:
* https://lore.kernel.org/linux-clk/20250911011218.861322-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (6):
  clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
  clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
  clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
  clk: qcom: camcc-sm7150: Specify Titan GDSC power domain as a parent to IPEx and BPS
  clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
  clk: qcom: camcc-sm8450: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI

 drivers/clk/qcom/camcc-sdm845.c |  3 +++
 drivers/clk/qcom/camcc-sm6350.c |  7 +++++++
 drivers/clk/qcom/camcc-sm7150.c |  3 +++
 drivers/clk/qcom/camcc-sm8250.c |  3 +++
 drivers/clk/qcom/camcc-sm8450.c |  3 +++
 drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
 6 files changed, 29 insertions(+)

-- 
2.49.0

