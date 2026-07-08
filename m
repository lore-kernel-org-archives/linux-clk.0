Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA5547886E;
	Wed,  8 Jul 2026 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522639; cv=none; b=cdibG4ATJbiVwt18tof2zmKxm00qx8NlPIwKTwl1WO9rfaByShGlF1wCPIaVtOO6HS2ejiwe0SSMsjKzhNK+nagTpZRnqFLOjTr9JjHWNZ6s6YXWPaSgkdIVk/6khM+HuFJKUn/AQyOi7fHDzeYbArjR8XWfTRGrPuFhWifd3xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522639; c=relaxed/simple;
	bh=zva2rRBeHuEN2IolFxVcZjYpcR3Ar0pDSVTAlH0qH+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ksnzf1q3sC+bx5JibiL735PCbgpIjiAkFm+FQewYWQg8xN3kJ3SqpptEys8cBOR81Oc1f+hdfGRaiiaWp88IrhqyKn/vh+4j6T+eq/evEs6KJnaXblq1F2SI/Quf3ZlLG5aU4NKZZ5HbSyGrluyzzE1IbXW3dWV6RZ3PmhQ/yk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4lmV3bs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4lmV3bs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB2F1F00AC4;
	Wed,  8 Jul 2026 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522637;
	bh=AxbHpsGj+0x0gXgzF45YXJSN7mWnZiagdib1WnEcxr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F4lmV3bsnVjGFCi8Y7qcKZuYfA6DqYuG41ohsR0HFpOpEb+/cz1DJl8z+hqDZsZQ0
	 z6A+xs3+OEtATZcowNqUyOj2Oo6+6YiBMlUtClUZXAJlOLwCS2+6sM/TzQ/FA/FfyU
	 okts8SQAhc5qJzWXI7dgUFikylwrG4ghaJdXlM/MICUN1TQtbZuh4Xl7QaeZm25kyd
	 vWgYj/UVTg7acUmaAXSk3ch7kvzIIDTNpZgBveB6QwkbSB51pcn8lNcFjec6NvrXV3
	 n3ufyoTfJxQ7H6nQnc/l0MwggyEy+Tc2hOkLdVhNH/lopHBvPvEMRCwDJifjwaSZjA
	 suVKz2MYt6w0g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: gdsc: three pre-existing correctness fixes
Date: Wed,  8 Jul 2026 09:56:18 -0500
Message-ID: <178352261579.2235436.1160754515486201566.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602140934.796697-1-github.com@herrie.org>
References: <20260602140934.796697-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Jun 2026 16:09:31 +0200, Herman van Hazendonk wrote:
> While preparing MSM8x60 support for the GDSC core (a separate series,
> adding LEGACY_FOOTSWITCH and RPM_ALWAYS_ON), code review surfaced
> three pre-existing correctness issues in drivers/clk/qcom/gdsc.c that
> are independent of any new SoC enabling work. This series collects
> those three fixes so each can be reviewed and queued on its own
> schedule without blocking the MSM8x60 series.
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: gdsc: propagate gdsc_check_status() errors from gdsc_poll_status
      commit: d69f0c2b8d292b4890c9f0fbe184dfc26c4de86c
[2/3] clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
      commit: eea55fc694e132aacbe2cf4be7f345115e3d1801
[3/3] clk: qcom: gdsc: tear down per-domain genpds in gdsc_unregister()
      commit: 86b23609d5e17a770d03037e53c6a443e742a6e6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
