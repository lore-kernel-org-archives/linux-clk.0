Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285313;
	b=SPlLz1rkPimeqg5W8qxCen/asoMH6k0QjwB3qa3JhOVRZaKo7QjSTOVUkMspeuo93Ti8
	 LNOw61zhuhWdrpKrLhSrfmLtnBZQEF2V10m7M7zaEGUy7oYqLtZjkDVXuAOjXTPTBIakw
	 8lXM7va067N2azD2rdDGHRijEQvRrMw2F1xL80eMBnYMCNTNDPXuKMAby56j9yqEwJ6I4
	 YyLSr+5AvHeYbGsXRawb8M0zkp9O/eQSdRhJCRiaqQV6pGDTsFj+iAZImZrB4iw1rdp4O
	 xrDZ6lvSBdBHjnhWuVboLHOELjimhujP+UV8hRjkgc9z5zOgrSogzG0Qd5HTuGYjFPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285313;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5z+mmwdv+D6Jf8swG7oinviZ6ESeu9eruFlMRnGD6Ms=;
	b=v60rCZVXM8QCWaP/ceMAyvlOfHCQtbKHttRZE81cxQ/oKEPCvjuj3TnQuyaSLgPZucsc
	 Eq0PrZANgIhG9ViKIYPlQ/USH+h4OuF8+1ItS2t8/FW2R/nhuaMhtN/HfnkldaLZB26Es
	 AJPP2DGfzafpJ26MlxBoUqMMqnRvBpTljy019++HFGlb1wy6XJK2RX57hRIqYpyf4JA+K
	 UqpwZOdqLEjHrScw68ZpQVP+VrZVkBYFiufg7vUN5rJh08cvBa1rOtw810HWo5deuyaIG
	 QsI6vE4nspjnExmmnAKUSn57VjhvsFjiuPjLxY3LLUOZNRKFXo96gc6RufiOSf4rMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8A6ClZh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64829606A8B9;
	Tue, 10 Nov 2026 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8A6ClZh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9751F008A5;
	Tue, 10 Nov 2026 04:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285313;
	bh=5z+mmwdv+D6Jf8swG7oinviZ6ESeu9eruFlMRnGD6Ms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T8A6ClZhOIzn1qebE2yGvNeGU/d5IFCb64dzNRu+k1FmQwmrzXnoafdG2HUQl5Nhb
	 nJqOIeNQYt3/IPOyaSdCBbIk0DwgONuRhR/yvCp0JYGrXU9Srh9wpcNIiOO+Iw2ir1
	 yxM8QtKLuw+pkO/8scdAU6WFHzSpaeNg6ToXqK3Xwea5PBAkLyrQp/gMu+HCkdhdg2
	 lslVb4n5pcVMs+UGWtfWaHnB+WDKxRSFpHpJJGCc8RGQmbiid+uEzJJ5iIKHrlHVKk
	 VZfrQr3upfB+l57VFAfIjMAn6Ysij0UNlw5yG1ElsBuC4AKYJC2Slue91NcRpgIEOV
	 RVz1pG0L6Rfyg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Set FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON for PCIe pipe clocks
Date: Mon,  9 Nov 2026 22:34:54 -0600
Message-ID: <179428529334.1061455.7701149257476653713.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
References: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jul 2026 23:23:13 -0700, Qiang Yu wrote:
> Setting FORCE_MEM_CORE_ON and FORCE_PERIPH_CORE_ON for the PCIe PIPE
> clocks so that the inbound data path works correctly.
> 
> Without this, the PCIe link can come up but the endpoint can not access
> host memory, with the host sometimes seeing a completion timeout
> reported by the EP, even though the host can still read the EP's config
> space.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc: Set FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON for PCIe pipe clocks
      commit: fbfe0c4beecfbd0e2958d91e5c95ff189bc489a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
