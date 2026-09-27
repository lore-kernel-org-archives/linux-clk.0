Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E903B14DE
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790523166; cv=none; b=MdQlDRLRkCJkKmLYBECiRGmt9PL1TIOxv+OUUCi7KczHPbMI+QMNzXHtbjWr2InvS02YYTP5aiVODJShCtta7/+EZoBgo+dhz1dOfrCze1q7rBv1QPaLc9LpYaQmqhUhOCObmwtPLtSEXXlR2p7/aiRqsDVzl5UjNRRKt4+Q+NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790523166; c=relaxed/simple;
	bh=AUELxXX/4KdMVFHfZVh7d6Npt4NuE8mNYbP31G6l8cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWop7DAdlbYuZDFtu//SGUv+9ItwNl2DJq8LA35MgzQibevUlu1E+U24CPIUE9Mqr78KJNQHRbgr4hES4c9nFWv/qibbIWAFTC9d144eaCafgEfzsONCmysCEbjyHEyVuzP/8L/JCIMZwqSrJBhY+1yMsh/PY05j47W2xMuUAS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=Bko8XzRm; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="Bko8XzRm"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-53336049862so5496601cf.3
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790523162; x=1791127962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUELxXX/4KdMVFHfZVh7d6Npt4NuE8mNYbP31G6l8cE=;
        b=Bko8XzRmxrxhB1yOjvyzWxL6fsflbVvF3cb+Jb0W1u854XoEEpOv1UgUywBedNTSG2
         f+9AuKYYMyxONsYCe8nY5+U3FhhMpvrwJL5tUtRRXQFpVfI7sgXMLKuqftBxvV+e5NWP
         tTQDTedpcQDJeJdgK+m6C38pvKZybvdzSrAKG/fn3r02D3ijRLNBDPH+rwhUrsQKR+jf
         irZaO7g9CxOF2fynph5lJO7/0MR3r5822IqdiHkpId98lewlIZF5N0u4A7bGSX7Hbm2/
         3+YJhCX01z1RxIPf8UDhMQ8Bo9J1+U0t/ZM0QAOvfNt0ZctALzDCZ52mLtvELG3J6Ek8
         l0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790523162; x=1791127962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUELxXX/4KdMVFHfZVh7d6Npt4NuE8mNYbP31G6l8cE=;
        b=KLdZW+8b7GLZAtupXmIIWN8YK4BPJgRmg0cAz7H8mvdryjW3xPT5uqhO6wdiNyGHKG
         MAj09RCgZe9/SgA6X0c4eMjMvXqwIZVc/ntWTyL1j6ulZGES0vYQHlC4eSYjO0Y6Numk
         T9D0SVHr+ar7F5JCOakNbG4Kk2dIzkJJsfytVKAEjTQRUz1cQQjeWRSkknlwq08S+YwF
         wCblQNTOvamFETNKDjoZ/Gke4qNNVfyXD8R/gnoVEhKpa1BPCRcEO9uJjewWsiXjydhn
         t5UqYDt4QQWza4ozL49YwCIwqNdvS+xgg/nyrH24YW6yeEC65HMOeBelPo7v07o4eI4K
         u/Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzTeHIsmDLVB6J80LCLxoc5L2C5RxTOwI8VR2Ajs7/WEg17Xb2/tjN0/Vs7YOR/ae4k9tXnRe0qMoY=@vger.kernel.org
X-Gm-Message-State: AFuF++mbqgP98E0dRkhfH3RBmIfPGOO3a1ZDO4oj7bHGSVZIilbXtMI7
	ol9mQFA177cFer3Bpft1RoPsdFYxTTLm0/NMWTeeKB6BBHwumuIgp3bd7TUVHKyHoKE=
X-Gm-Gg: AYBFou3fuwszzzJ0kEuNROb/eJnEbWLc66+InjJ7RwmWiNBxdw4Lk2y93op4CEg4D9+
	DX0YPqNjN+dQAdD1haP1a0KMkTLWjNZFdrlQVmJTywxD7/0/FEPwiYlgqosgIVTC1pEKE2XXidK
	5VOY97R/w6CnUgj6x58UY06WKPzofDwtjcuYiQHodNq1mrDpi/aVrSl0tS79HiuQBNg35lsZKDv
	tiSD91Big12Fk6kdnV34POKwGFYS9uFZvEFNyngg195wFbnZUhf2xPct6IP+r9BjvYMhcj1c1K8
	jeWLCtMu8XH/n3LkuyQumgQL2Fu5C/yagVtfDj8ThR8T29ck4DbsdZ0LYc3jwr4BDCxKN0X1l6N
	/r6n7deHSe8Pe/gMgq6x2dK1xM9lqHs0AhM0BCeh1f1PJCxiKaTCwWXik34GtTBK7Xo7jT27WCJ
	CtkGf89yq2qo87USVBg53sGOIrhm2FKKbyES4NNSmmGQ+7L20=
X-Received: by 2002:a05:622a:4d9a:b0:533:33c6:e636 with SMTP id d75a77b69052e-53333c6feb6mr56127141cf.6.1790523162378;
        Sun, 27 Sep 2026 08:32:42 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322020e91sm43319281cf.1.2026.09.27.08.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:32:42 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	johannes.goede@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API devices
Date: Sun, 27 Sep 2026 11:32:36 -0400
Message-ID: <20260927153236.2727-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <105d1f73-5334-4ae1-8267-1927f8691a06@oss.qualcomm.com>
References: <105d1f73-5334-4ae1-8267-1927f8691a06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 27 Sep 2026 10:40:33 +0200, Hans de Goede wrote:
> It would be great if you can post your DT bits for this upstream soon,
> then we can add them to:
>
> https://github.com/linux-msm/laptops-kernel/commits/qcom-laptops/
>
> and more people can test.

They are posted; v3 is the current version, with Bryan's Reviewed-by:

https://lore.kernel.org/all/20260926122533.8200-1-lnicoara@thinkoid.org/

It also links the sensor to the privacy LED. It applies to
qcom-laptops as of 3e45da63f61e, which already carries its
dependencies (the x1e camera DT v7 and v20 5/6 and 6/6).

Thanks,
Liviu
