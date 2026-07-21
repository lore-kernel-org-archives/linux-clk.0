Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8EB1EDA0F;
	Tue, 21 Jul 2026 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637437; cv=none; b=Sk1vadky0V3zo3JKrUetKXqVjWbavDL6GzECYFQ4Gm3aAJ6faRWBk0TF+qiDjsXQb1j4B28qpo6rOnTSundD9S0rWh5BGQbLZswrgWKYXrER6E+3f0J3w/gQkrwoMpCi9oLISsYTB4gYYvJLzw9wnazKvWXlgB+TbLh0HLpmg1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637437; c=relaxed/simple;
	bh=U4fj03Py4P0EnSAJIKgGip8KPplL7G7WTFxOCjzlgtU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=DbmdSYYS6RPAo15Suo7ZMaeCpIPrOaX+MSJVAHI40xk2XixJGuaQ+U/7potPwGDtxsYTLQbW0+ZuWhiWhTUdhhH6zrOloc+XkD/3ShXh2YLsPXwQnZr3mHsJKnAkYZReNnV+1HFDq5BTiJcy3QZCwWNi9AJHJV6XVtraYplISPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ddw+IOn4; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ddw+IOn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784637419;
	bh=Q3WVCZdvhuzyHyhwodqX72fDjFGew7fzT/sycGPfkAg=;
	h=Date:Message-Id:Subject:From:To:MIME-Version;
	b=ddw+IOn4Z1IxGNo827TTOcA+zo+Q+to9R0k3LDcjnGaUHh/cDeZIKYgyBCA42Ar4B
	 8sXAufBFF8gOxzFRuFbFHlKcYFtKDrObT/WJjwTMJDaNoeucGmSbTztMG/HF1tJJNd
	 fIRIAdt74fiza5NInm3MyPo7IijxG6dMTQPCXJTc=
X-QQ-mid: zesmtpgz3t1784637417te9d389f1
X-QQ-Originating-IP: njHsgAYR90QJ38EFUoM52TrKnqiRhrriBDg10lgkAhg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 20:36:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6462590554883498070
EX-QQ-RecipientCnt: 15
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 05:36:54 -0700
Message-Id: <DK495Y6IBTSP.B55YW3KSSPL2@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/3] dt-bindings: soc: spacemit: k3: add i2s_sysclk,
 i2s_bclk_factor and i2s1_sysclk_src IDs
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <sashiko-reviews@lists.linux.dev>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney@redhat.com>, "Yixun Lan" <dlan@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
In-Reply-To: <20260717073330.3CC8B1F000E9@smtp.kernel.org>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
	<20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com>
	<20260717073330.3CC8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ObFHHlrAm4404UbD/nd2kVy19hy8HzuKctFHMY3TlPCPjWmoA/iZ7O31
	piVS9BHD/aI0WPsvAE+q0ntZ2x0XfgsKnfOSV3Z/xfmEXsBkIy+ARqldXXbZfp3XQpQHoz+
	n6x0DVD5JyZiZ4ua/qSyVG3KNs6pkNEwAd0suz+Nje8CGGpuMeMqynRrTzfxPez8X1Uqrza
	fJTK44e3RaHm6JVC4gNCRZ12LUItlCuE50Wc6/CoApZyPqVXkJZ65eh70TUzX1WfA0SC5B6
	VmXBWYjR+6WY+MNtYcAaLXHqOleCVeE0YbF83Cmw3r6i0Ak/I6+InVVsonke9Gf3+FGQ2Dn
	Ow8dLjtTxONTGFxM16hGuqfD9Wk1Oz/JyTKY8x5BKPbCc+TYqdtmLi3X1eOUzXcDe67nC0k
	/VImbbZNF6IBRXjRAENwH4OYmcFhsjoEOjo6t+N6cAAORUUOq0CVzC9PZGkHwKx7bWHsd6a
	cOUFHcv2qwsyO4X8iEGofcO9KGVPhrTteMExZLpucP+GKlhFAbfTandGc+dUoT1u8SmjjE0
	JnV9C0iicv2vWAvQNcmtOyJDrPC/lBzYO1cLog7USN+gACnxOhqEW6bDMwauBXV8/11yjw9
	hzuiChp9d9Fw+xDM5olQ/b927b5Tdy8UQOn6hWCIZyzyg32xGm+ZYXZhYbTTcJGGsyg4/UL
	Z0Vq6URyDaH5IWrjc2ka8GmPCJxQBSu2fkxKF3HQnZ510XZG1HoR8tkE9A1CHiLgM6nozzI
	ml0U3gH904yVlHMOPrvBjSxlhSlaEH6a9VSDACi/c9F2M+f/HQdsosWJ8uGd/oT69Qa9BqA
	RXzNg6JdrbMpILMs69rDqwSB4wksIPW+8txYBHRwwpvu9QrMnEAxAykOKAf8PUur+84cYPz
	mSbWGLNdldlVwjy6P68BuQHEeoKcknRf8Vq4y1E2XC9LMduOD89wGE6gCD3CSbEEkBUBgFi
	0E8FJJdbN4sb9tb7t20gSiTUbPJ8B02W7fuLoB4hf3NUqgvWBdnF8ZnuuH7EDfuF9HNhlLV
	sNe1yeOwGkWvwcwxdRKDi5HCOK30KBTO+VCMWaPMPJhkxZuRG8qtITcpizcNM=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

> CLK_MPMU_I2S1_SYSCLK keeps its existing ID (47) but will be repointed to
> the real per-instance i2s1 clock in a subsequent patch. No in-tree user
> references this ID so the semantic change is contained.
>
> [Severity: Medium]
> Does the commit message reference the correct clock ID here?
>
> Looking at include/dt-bindings/clock/spacemit,k3-clocks.h, 47 is actually
> assigned to a different clock:
>
> #define CLK_MPMU_I2S1_SYSCLK     34
> ...
> #define CLK_MPMU_I2S2_SYSCLK     47
>
> Could the commit message be updated to reflect the accurate existing ID for
> CLK_MPMU_I2S1_SYSCLK?

Good catch. CLK_MPMU_I2S1_SYSCLK has ID 34, while ID 47 belongs to
CLK_MPMU_I2S2_SYSCLK. I will correct the commit message in the next
version.

                                            - Troy
