Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3EC53B613;
	Tue, 29 Sep 2026 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714063; cv=none; b=tT6SWiYqbzSqYVrG3PhNr3rurqh+DMat8j4k5w+u9Z0vGRoF8RH3ns1C+6kLEW8unWvdEcCNxvF2KKdekBrfSc/1SQRL2Ru3NPjV4BhVheMbctogfO11ZiV1eOWl5rocpdk348wcDHOrLq/H88JXuxoDj6eJX78HYz9l/lcSaVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714063; c=relaxed/simple;
	bh=uqzPvssUpU0NWV7aeqFhFC1Ds8F9yGTwzUx3rMzSJfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tcl8Fwme+XTM3w56aK4VxSMRPmOB92KguNGzICuUPMnMLNNrUWozI3A8VuZlgWX5Bjdb1HSrYmXuCPY8cEG8dhuXzMN9JynmfULwi5eg2d9jRl5q4xckfZTzgH0d5+dEbZ4K8pTM83GyfPrMLXfo45HXT3arviTHZ7ILgVaJGzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2U/jp51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2U/jp51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D821F0089C;
	Tue, 29 Sep 2026 20:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714062;
	bh=eVDGXtda6alBwsEddGUj6QdZKxkb6ETP0ChakBOah6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E2U/jp51+5HhnrCYQQhxCUTkz11TyWvbDR/oIjRg2249zcr5KQ2NmeCIOQSvYqm06
	 OPd+IOkLjKZx1qN4Te05xbgp3g4DywN55mRYZKrj7HVfKswvan2iFIQ3jSAIxZTPFb
	 gdtHz4HJRqeKW/BXmm9WRocpuFr8rdIlz5EuZ/CP89D4Xw+IYEXsESjbZpC2g3hJ8K
	 /k3xd3rziQJVLq+M9R28nHSaYoQ1Qi1+7zucW/MuzjwbWuvfDT1xK8C6cinWcYSofo
	 sYgcsxYwPdBiXlC+tLa2eFAamPIn38Z/jtJa2wg4VkwqJR5DrqIiU3ae0Yxnk6AoFB
	 vTUhwRbxH1Cag==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5] dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller
Date: Tue, 29 Sep 2026 15:34:14 -0500
Message-ID: <179071404937.2903617.11280795356567912201.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com>
References: <20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Sep 2026 14:07:18 +0530, Taniya Das wrote:
> Document the CPU Control Processor (CPUCP) mailbox controller for the
> Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
> mailbox controller and uses it as a fallback compatible string.

Applied, thanks!

[1/1] dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller
      commit: dd647489dadd1f9460fa7280f08e4b65cb9aa349

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
