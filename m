Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856C1990BE
	for <linux-clk@vger.kernel.org>; Tue, 30 Jul 2024 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722338194; cv=none; b=ikKovLxeMUQD5mU68TM1EOLpNXj3mc6ZIfhX5eckKpReTY6Wl1nupDLvTQZdxKVfg+sFUd82miQlQ8HN3+g2R4jxqalpy11nEkwIhDIOq51vOLmn7Ne93aoQh1STTSkJlURe/zpNnLXv+USEBvms5AKVUIgswUdvmHT6nvY6iOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722338194; c=relaxed/simple;
	bh=hC2WQxH/kBum7QbSDLq1q79vdrRz/CgFdhb2ErII8PA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=mkV1DuPFWfxKR3vhjHdedXvEf5YSUN6Xuc9eJFP2rN1vepYO6vT/PuVZGDGLIKcgYIXFbFOECelcuen+szDDNZ0oMi9GxR2aZOsoumsSvldlO0/G4lnzSV9ws5tQp+EcySYppVGo3epWRe3DLS8Z6VUi/XQ11vXLEQRyJFTN608=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TG0GG1v5; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TG0GG1v5"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240730111631epoutp0499a20faed138dfe9ee819370122bf904~m_XWli3nN2159321593epoutp04r
	for <linux-clk@vger.kernel.org>; Tue, 30 Jul 2024 11:16:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240730111631epoutp0499a20faed138dfe9ee819370122bf904~m_XWli3nN2159321593epoutp04r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722338191;
	bh=vpkkOKK/ntAcFPtUcCigR63OTKRjKSJ28xLqzzoImfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TG0GG1v56Vc4q7Wj18YLGF15fUklWFUGmMse/vIUA/e7RmHFoPZP8XIs7Wc11A9vX
	 A9fA9nrMkmyRJQnM3urzFzTy2q65+TUz5u3GDFR+/h3vSnwDWBeiiFCMfYaO3cPzF5
	 kYvWgMpfRqytMkEMfXdC+J3vv3TD2GAU7jToMw5Y=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20240730111630epcas1p39e14bdcad6361d46861f13f57771f3ea~m_XWDpt1v2188521885epcas1p3O;
	Tue, 30 Jul 2024 11:16:30 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.231]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WYCNF1wMPz4x9Pt; Tue, 30 Jul
	2024 11:16:29 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	E7.82.09725.D8BC8A66; Tue, 30 Jul 2024 20:16:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240730111628epcas1p1c90e2563a5472f963213c9ee58157a9a~m_XUEPBqv1944819448epcas1p1C;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240730111628epsmtrp121c12cac718fbc2de6fe64f703cd74fb~m_XUDHCaB2131621316epsmtrp1M;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
X-AuditID: b6c32a37-1f3ff700000025fd-bd-66a8cb8dbaae
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	FB.11.19367.C8BC8A66; Tue, 30 Jul 2024 20:16:28 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240730111628epsmtip1abb5beb4b1a3e40778d8f12c58438a77~m_XTu3xEo0676606766epsmtip1t;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kwanghoon
	Son <k.son@samsung.com>
Subject: [PATCH v2 2/3] arm64: dts: exynosautov9: add dpum clock DT nodes
Date: Tue, 30 Jul 2024 20:15:34 +0900
Message-Id: <20240730111535.135301-3-k.son@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240730111535.135301-1-k.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmnm7v6RVpBk8PcFs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKtF75qrTBbnz29gt9j0+Bqrxceee6wWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLVrj+MDnwe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8SS6ALSrbJiM1MSW1SCE1
	Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoWCWFssScUqBQQGJxsZK+
	nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsaqUyEFt9kr3nXe
	YmlgXM3WxcjBISFgIjH9Z2kXIxeHkMAORomLsxeydjFyAjmfGCVWfeOHSADZS88cZgNJgDUs
	vMgEkdjJKPHhywoo5wujxL4zf5lBqtgE1CWWtK1lB0mICBxnlDizpJsRxGEWWMko8WDVExaQ
	KmEBT4nWlu9MIDaLgKrEnJc7wXbwCphLLLj9mB3iQHmJxQ8kQMKcAhYSza+OsUOUCEqcnAkx
	hhmopHnrbGaQ+RICczkkdszdyQRxq4vEy7vroGxhiVfHt7BD2FISL/vboOxsiaMf90L9ViJx
	fdYiVgjbWGL/0slMIDcwC2hKrN+lD7GLT+Ld1x5WiNN4JTrahGCuvNVZDtEoKnHm6UeogR4S
	+y7sZYSETzejxKULt9knMMrPQvLBLCQfzEJYtoCReRWjWGpBcW56arFhgTE8TpPzczcxgpOr
	lvkOxmlvP+gdYmTiYDzEKMHBrCTCG39laZoQb0piZVVqUX58UWlOavEhRlNg8E5klhJNzgem
	97ySeEMTSwMTMyNjEwtDM0Mlcd4zV8pShQTSE0tSs1NTC1KLYPqYODilGph8rp5Rm+9uGLXX
	XsF/7d5v6gLfT9TwdN5+wV1ls++BxprGbWlinX+Wahqr9crxX2xPLijNybyw9GPiJYlgtx9z
	jFj4VWvkl3+ZczhV7RvDeVYJ2XLtsJOBnz8cu31zxYww63Vx617zTrycbv/95AxGlisdyUxq
	wZvXfTmho78n/KfNpdvr/8yxNjLVm+rgujdGoEFhlSn308/XrP/N2rjJ3LJ3sbxpZ5Hbi50s
	+9881O6f8Pmdhm6L2JrVl/pj9xpx7Z+h1qTFNL1ZcNmqoK3PZ5Z9OTZVQV3hc7ue9F+/Ga3p
	Fs3TxeefYFbJUH6zZ0FyrOqjZZeuTnF4ef5Ebkp/2+rWpbWs7f+Dw4PfT1BVYinOSDTUYi4q
	TgQA9lbijjcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnG7P6RVpBh+viVo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKtF75qrTBbnz29gt9j0+Bqrxceee6wWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLVrj+MDnwe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8SS6ALYrLJiU1J7MstUjf
	LoErY9WpkILb7BXvOm+xNDCuZuti5OSQEDCRmL7wIlMXIxeHkMB2RonTq95CJUQlOi43MnYx
	cgDZwhKHDxdD1HxilDjz5zErSA2bgLrEkra17CAJEYHLjBL/F0xiBHGYBdYySjyd8oQdpEpY
	wFOiteU7E4jNIqAqMeflTrANvALmEgtuP2aH2CAvsfiBBEiYU8BCovnVMbBWIaCSDcuPskCU
	C0qcnPkEzGYGKm/eOpt5AqPALCSpWUhSCxiZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIE
	R4ZW0A7GZev/6h1iZOJgPMQowcGsJMIbf2VpmhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe5ZzO
	FCGB9MSS1OzU1ILUIpgsEwenVAOTsUpYqXfErCPCudef3n0VdsjS2O/pLI1l7743PrrHeOaV
	Gsvx3GkML3IN/qZfWGxTsjoyYsrG7CeWL/barneX7d/AetXfLXb2NeZ3ys2OSxW9nnlEhdYf
	YIp6dcOCS8F6uVnhNGEOxu+xlXpHuT/PcTu/qK8g8dzTHiWHpglffT6a3ErTqln5cAfX0u+a
	F560Mdc/b9rweNdek3RLl3ir3SZtr/knq7J4t01ZKMNtyKwy/XScD5NoVpzJ0dd+cycXLzh5
	0kC7tmB3/amvioHrdvhOtJ9o5eC2cuaMhaGrHjVU3vDo4FohkzNnucB/m6qeDYvmFqyo2tLb
	veG67flVUyof6t/c16cy3c/n2EY2JZbijERDLeai4kQAKVmXJPsCAAA=
X-CMS-MailID: 20240730111628epcas1p1c90e2563a5472f963213c9ee58157a9a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730111628epcas1p1c90e2563a5472f963213c9ee58157a9a
References: <20240730111535.135301-1-k.son@samsung.com>
	<CGME20240730111628epcas1p1c90e2563a5472f963213c9ee58157a9a@epcas1p1.samsung.com>

Add dpum clock for sysmmu, dpu.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 0248329da49a..a8e57f499fec 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -251,6 +251,17 @@ cmu_fsys2: clock-controller@17c00000 {
 				      "dout_fsys2_clkcmu_ethernet";
 		};
 
+		cmu_dpum: clock-controller@18c00000 {
+			compatible = "samsung,exynosautov9-cmu-dpum";
+			reg = <0x18c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_DPUM_BUS>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_dpum_bus";
+		};
+
 		cmu_core: clock-controller@1b030000 {
 			compatible = "samsung,exynosautov9-cmu-core";
 			reg = <0x1b030000 0x8000>;
-- 
2.39.2

