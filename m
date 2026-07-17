Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C03769F4;
	Fri, 17 Jul 2026 03:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258616; cv=none; b=EbV9f78mX85xMRW/07TTyudJCHJEyB5O3UrnYmyYa4xmkrPrYPApwNcSMdNLfi+PjXUtOPwOEW/udc4jtiY6ht+LhdsoipC5evwrTmQtMqOgwrisrWrRhzy28RdrszxGf90fdATRQBMQnf+ouwfcodnvkQGWfjI1swkW4u3mrmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258616; c=relaxed/simple;
	bh=1M0To1MU0tImHUkn34uPpb19O3/0IcPwD709mQbCsao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0XgGEwhYk4gFqKjJ8lqlScA5Oq8U+Y1Cvww8+sqSOd91ZAZWrU7YNMA2gT2r8TcRwK28cjRT11viVZZckuGH1Lp1zkfpGb3SCWOdO4ywlN/0ojlvrCYWhDmVQ72UQwVDNhPQE1cu+TNouFVs+Yhz9ZXaTILTgQ2JfS73Fi08es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BA1Hir2M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BA1Hir2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC9B1F00ACA;
	Fri, 17 Jul 2026 03:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784258615;
	bh=o/qb2RKP1gt+o5S5xlP/9GtyvSsasD9MBz/T5eM9AMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BA1Hir2MfK2xX48hv5Dv/8u/3o9fb1K0MSIwcwcflO8qaXGLrmZAX3qcSk2B7Mpea
	 7iErUhOkw/0ru+XTIVdzwXKUPCEr057/BplJiwD22EY7TTJ3Y4HpZp5YQ5U06L3doD
	 YwMH/OPnPqOUk53awsior0I340c8epHqTHyPXUDm7FKKHUeBQxVfMKI9PmrKkLD4g0
	 JxVfkcoFZo0q2on9ahvbo3swp7n0fJETP/aSPR766CBsoJrJYGK0fG0HUSaW5E1BZW
	 2dopaO/8/5zIhrrNArX7xoF3Uzga/8TfgKoIyrvwp3FjjnUkaw2ZhSztwR0pwQxEfw
	 bIN8cpUpNzy/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: (subset) [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to controller
Date: Thu, 16 Jul 2026 22:23:24 -0500
Message-ID: <178425854604.1084804.1992392341244608368.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Jul 2026 16:29:13 +0300, Abel Vesa wrote:
> The suggestion of having the CX power domain tied up to the GCC
> controller started here:
> 
> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> 
> and then, for Glymur, it has been brought up here as well:
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain
      commit: d22a37e9fba7838cdcb8c55b913b1a37a7a4a198
[2/3] clk: qcom: gcc-glymur: Enable runtime PM
      commit: 8d4f342369d0d77f32a0211692442d3b6d455872

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
