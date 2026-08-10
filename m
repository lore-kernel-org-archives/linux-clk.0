Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817F23F8EB5;
	Mon, 10 Aug 2026 18:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387569; cv=none; b=fT7Y8n2w5gUHSNSd7XASjsDbluhXcW/0cub8KyJ/v1xvwxrfILp+LofR0x2actfEunFcyYYWjTcWjwegyMNv2p62iPDVKg6hj7NuP3CSaxDjCTPjtCMeyIEE2u6TdN9GVL6fjVv4CTAlIzxyYGS1QepKoqj2CqK9zbdwTftqjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387569; c=relaxed/simple;
	bh=G7FbEWDFTgOxVyjJBdsZnKEWLL0/5IoI6ECE8zg+HGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RnV1Pqn6jzR3pfOe1iaQN7H3YNCfubwVqSrCbj5n1rlcIHB972QSBOXN4LFTGAtLxRST4qeHbV2cbZI1oGy2esKm6mWyIIE2IxKqNUpFzm0qMwyCOKziI/9B0WHZ33DJkcjidO3ZcUlJV+O97Mwzf/QvSDa9rRsNLNkCnqADKt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1MXJkGJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1MXJkGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B22B1F00A3D;
	Mon, 10 Aug 2026 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387568;
	bh=z5jutlGOg/t7BT5EgxWe4azLK5Mw1jtuMjUQ4Pz+JYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q1MXJkGJuAu7iijICM6V/Vl75Mm/8bbA6ba+cCz49sVSnmR+PewPAK7CEW5SakUX1
	 Rtj+rYx/O5yHbZZDPGJsotXVPvOLmWS6BLIPTQQ9/YUIqPU71qc3qySHNBaA6G+EN6
	 NrGHYaqw4qCy/z7RnYjDCiP8kKobitJqelodrJRQiAb7hexDZ6Nshm4cz9WP9SN2hm
	 gNeASg7A4U7s4S+TT2sWF5w16DXBlxUWbT/eSZSXk+JPNDdocJqqe3oboocD+2Eku2
	 GT1HWWUZOF6z6lseL/ceT7eajSa2DQafS75hA3u2VeBR44P8gCjBnXwrJGNno41n0E
	 BCFPCFaYrQKiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] SM8450 QoL changes (dispcc)
Date: Mon, 10 Aug 2026 13:45:54 -0500
Message-ID: <178638756046.656675.16968994227827052752.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jul 2026 23:28:16 -0400, Esteban Urrutia wrote:
> These patches are mainly focused on getting a flickerless boot process
> on SM8475 based devices.
> 
> 

Applied, thanks!

[1/3] clk: qcom: dispcc-sm8450: Fix disp_cc_mdss_mdp_clk_src ops
      commit: 60eb9e0879cfc66c997e233c8caa40a3447cad11
[2/3] clk: qcom: dispcc-sm8450: Migrate to qcom_cc_driver_data
      commit: ace1365aff94bbc00a5bb8c2f87fac2f13f1eb79
[3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status before configuring
      commit: 23fee7d2f1f1c600c190a950a421eee52772236e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
