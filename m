Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6773C0A03;
	Fri, 11 Sep 2026 02:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093553; cv=none; b=g+89doDImrIZvgLJmg0mY+YT+QhK8er1WaqOx5O2gUdZ5wPrKmo4S9C9luRklwahqbJ7cGhuZMBTo5g/APorhLocpnsJzR1oGgr1Nf8nz96eVbGe4nExNsvb5oif7y9LiRblt8Ud+Rn/qMAtB+7XdGexOU7CK0HPSZy5PCcRB2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093553; c=relaxed/simple;
	bh=xuYn0iR/WfyC7CYI82AZnn9F1Ja6VynfK6gyZE2g4hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ub4+6D+FCAXV7gz2x5MyWd/gtlUq+veUB6L9GI3HGrIDUA3Xbb81nUhVROWY4C2uhMe5HySUgOg16zvxGMeGbyZigW24EDg0KftiaM7vjDEbbj/76c2yMbgMTumNyUtVM2Bk+H1hMVglP78Ji7gygvhHldXzLkRDbznDxutkVL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7IQ8qhF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7IQ8qhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7041F00899;
	Fri, 11 Sep 2026 02:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093552;
	bh=5zsYXz8xhm9REfCaGn8sxG50pGkCwrjl5qKoEYj0VLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A7IQ8qhF3aTQhv3Err0RpJXtNL2Wbew+82fbDJwza75m+Nuim+lx/i0tod//D+20A
	 04GVrvjcsKj2keiWqSEBaxEKFYZBdpTkjLNs0E8E5+SjyFyvnlk7NrxYGxUnM11oyu
	 mjZftjvquFhbWvAjW4J2h3nv2h8/zQE6Mg2BMiZnLMAr3A1iX0+wWJNgG0sdUwYLsN
	 j1dca2cNLS7xlBfvq1ViB5hzymSFrd+IA/CS9gFSdlnf770idNVF7J7ycXcYiZXago
	 ykPOOtj+LwGN6d2F05NZnyJyKBADkClagQbTTCKHemB2no1uabZpHRkBiiY+51XvsF
	 2kZ9j85+zO+WQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Abel as reviewer for Qualcomm clocks drivers
Date: Thu, 10 Sep 2026 21:25:29 -0500
Message-ID: <178909353855.920241.679898572407530564.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902-maintainers-clk-qcom-add-reviewer-v1-1-dd6b6799b494@oss.qualcomm.com>
References: <20260902-maintainers-clk-qcom-add-reviewer-v1-1-dd6b6799b494@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Sep 2026 14:58:23 +0300, Abel Vesa wrote:
> As agreed with Bjorn off-list, I'm stepping up as reviewer
> for Qualcomm clocks drivers.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: add Abel as reviewer for Qualcomm clocks drivers
      commit: 161e7f9fe349b7f03920ec4c5474a8b570fc9596

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
