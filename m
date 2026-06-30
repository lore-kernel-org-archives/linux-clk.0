Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F7841166B;
	Tue, 30 Jun 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823994; cv=none; b=Wnnd3rmEk5LZMzI9fngMLonI8qStfm7VXpvIP13F8q9roIJmRk4n62yh4FqlmonxrgSopx3T+LRsowpXADi8VWAMNmjBlOYNzkbEwAbTtzgvqdCr35z50D4yTH3GMfiPP8U+J419tmp+OrZYY8AB/5TTAv0huME+03EXU6zhSHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823994; c=relaxed/simple;
	bh=0N8wB9AygfV86ZorVys70rYyjqXDnG7WcMIqzIZbULA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQJCNx34xkMd55EX0o3n2FXFUZPSMXz8YRI5RcoiGIg/WDWlbxnuFG/KwU4ckQCEwsgwylGBBQ9MCjG5gDEJ80DbSXV2BgAdFXxJts4hOAss7VQfs0/Vp6eiMDw8Rp6+pvrNwhStPDoaN6Y3NsXpt4ANHdaPA+fHdS0oALlvysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLnyglxS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLnyglxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E131F000E9;
	Tue, 30 Jun 2026 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782823993;
	bh=XbpRzGPd/1ntY5OxN5hkLLlD5mSljwyCXcdDCBAm+aU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OLnyglxSldNUZol091T0wxb+26ISICSulG0mz2ZMIqjpXRXkmWJDyV8hyZOySlUbg
	 QWn5hIAYaw2Ir4oZM+YqkKAkfVdo7eZDQf3Y2a5uvirqOJrOms8r7g3dUqKqQjltkU
	 yeQ/NgD+nJxMlbBkobqEguaiRNsc2DRt/dV6GdzASCKSWkCetFMXRwUi2L9K5FNKd3
	 KGDK/79aOT85x0TLFxsM7KVEQww7HdGOYgYGt+dhqttyNVnGBB06vRY7z7FXOM0kaA
	 QEdtFBZ4kbexZKdHjS4MvT+3pdjOwzXtQ/MeJqUBREI6q+q/g5/N0mfUUaHEymURDN
	 jRu9sdfbpIQbg==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 30 Jun 2026 12:52:46 +0000
Subject: [PATCH 2/3] dt-bindings: soc: spacemit: k3: Add clock ID for UFS
 refclk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-06-clk-ufs-support-v1-2-cf7521d1d0fe@kernel.org>
References: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
In-Reply-To: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=707; i=dlan@kernel.org;
 h=from:subject:message-id; bh=0N8wB9AygfV86ZorVys70rYyjqXDnG7WcMIqzIZbULA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqQ7wpQtUsn2WvndZxzP2ao2TZfEZVp/46Op6Kh
 hEGKXQUNdmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakO8KRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+33Cg/+IxquelHZIKSNOkIiy0rET64Y+bOST5nLQUR4t6mbvn6ax8FtKurkt
 j3As9zheRpcSSqAxHBiuo1MXJL1FSxMxOAYpcHmWLrkjRcIl7ZGNrlhNpv8hdwXfd8W1UOtNA6P
 IYLN+ohVE51ccQa7YyHRYAdMz+cDp6SEWHIprJMEenFPY8ihoNck4UWjK5oX+A/9hC9ptVplfsh
 OMMdYGVd1bznXTfO4TQ4TMe5I3Wn/r6221pcQHRVRrrVWO2bMlvRlT0Mo5/EEqCpdPWiKLR/U3c
 RIyLy6+hz3qvrWrgEW019kwMrLDTJi0Nxc8+80V41Sqyla7MTLjFVta8Akfxz58SWXdPgIskyS/
 2xVnyDIUh9AsbAPQULp+7SZBJzIaoh5Ew1ho3C0FvPTbAhbBRz+0V6181dHTJZXA7yTRveGIQoo
 q8/twiMXnqHDabXSbHt5yRnIN0Kyzz8epWgH+ZI1VxWc9x9BhuPjR67RzYiDA0+CScmoIEhvnaN
 KeB/FTNd/UavOstPhq+mWg+VGq+d1dq6h7aP+Yi9Q1HLWuom6os2FrbbwIDE3w4Ks3POFfKmLFf
 Uv8Rvqh9puOj6x2HZqvtxxDhAvPcdiEUihQcEguLZE/tP+hnLP3cUolS/qBhO13+KjM+CSDobsL
 1y9M0ZDp/29d2/+M3tCNBA503zye9M=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add clock ID for the UFS refclk clock in SpacemiT K3 SoC.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 include/dt-bindings/clock/spacemit,k3-clocks.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/spacemit,k3-clocks.h b/include/dt-bindings/clock/spacemit,k3-clocks.h
index dfae52547cda..69978ab0b29f 100644
--- a/include/dt-bindings/clock/spacemit,k3-clocks.h
+++ b/include/dt-bindings/clock/spacemit,k3-clocks.h
@@ -385,6 +385,7 @@
 #define CLK_APMU_PCIE_PORTC_DBI  91
 #define CLK_APMU_PCIE_PORTD_DBI  92
 #define CLK_APMU_PCIE_PORTE_DBI  93
+#define CLK_APMU_UFS_REFCLK      94
 
 /* DCIU clocks */
 #define CLK_DCIU_HDMA            0

-- 
2.54.0

