Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44033FA5D8;
	Tue, 30 Jun 2026 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823988; cv=none; b=PWc1ydcvb01gIZfU/4xKS0gG3M0V4Fdcf/xe2hNu+XdOrUMgs9XlSjJN9HqHl3M+kdLYj2tOoGG9J0zc2vhLU/EFmiT14q9BwC+VIYeOtg3US1K+3c92C0rEfA05uJwE0mGV/dYJcd06EnjQ4ZLumBmTpvQ3HgNRWxU6FG2ozbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823988; c=relaxed/simple;
	bh=ROcY5MyDjeKC0r7oBgUYsRLMttcLNK+R76DuiYC0u4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TkGHeCOpqbx01TJi6SoNcuAReBbnQQtQ6nQo045HWpMpEVhETARnAvMdF2CD99RfpGYwKmuL4jKV8bZDXuR6VIOeU7yTXS7WVbuT+qFHL6R7P/1XxumMy3WIvlLWK/OiL//XSgg0ESmKqvsaffgNY3nv2hrnO3ZZ6XKikHt4rF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZvw+gJt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZvw+gJt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06DF1F000E9;
	Tue, 30 Jun 2026 12:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782823987;
	bh=fFTV49VQW5ZLiYL/aWzjzFEMFn4A4VsTnUBjOkMuqWY=;
	h=From:Subject:Date:To:Cc;
	b=BZvw+gJtjsEfu3BH3FwuCAS6hJw15zwm0YFP7w2g8qNdTKf9SuksiES7LX89gf0zr
	 NVY0CR0pwdHP6ns2hzuACB73oM+Oepgb3ydWKQWNrNKGwl8F46XAL6ZXwWv21KDn0F
	 xgYkZZmyBSXZl7IjFbi19+IpQcJayjilVoY30lNZAcMgPLtKsD6EUCJQPqEVYjNHsv
	 qflbEwUwWR+k1cUwS1Qi6UyggJ92eBNlaXKrfviw7bOC+v5VZQYSzWdKRojzf2Lkwj
	 NuBbKYzkeWFHRmvEi6JL5IQAUAd7kXAlYVLw0DdE91bhLEK8ILzXlQs7dNenN5Tl+Q
	 D/I6R+c3zneTw==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/3] clk: spacemit: Add clock support for UFS
Date: Tue, 30 Jun 2026 12:52:44 +0000
Message-Id: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABy8Q2oC/yXMQQ6CMBBA0auQWTPJWElBr0JYSJnqqIGmQwkJ4
 e4WXL7F/xsoR2GFe7FB5EVUpjHjUhbgXo/xyShDNhgylixdkSy67weTV9QUwhRntA352jR1Vd0
 Ichgie1nPadv9ral/s5uPE+z7D0ZG/5Z2AAAA
X-Change-ID: 20260603-06-clk-ufs-support-680f72874490
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=dlan@kernel.org;
 h=from:subject:message-id; bh=ROcY5MyDjeKC0r7oBgUYsRLMttcLNK+R76DuiYC0u4E=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqQ7witHp46MnBhRPjHRqWbO9ifeIppPTxvDQQ/
 YQNw4zSt+eJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakO8IhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1OmA//food5KEGKOPt1pFdI0WOzWHoqS7YKsm7TL3J5jP8jn9e5T6VUg1XC
 ogEi79jITIqS7/ffigZ6qgvw14YLGl2n5gxLNiJftyEY92bT8/XIuO2rWImBZ0TwUduqMoLTeeu
 t3tzVz3xkOLdFF7uNIa1E11NLgiTbjjFgioIFeLAXX132Mjw6ZFDHOVQAVKLSrGQAgNMpjgyBhP
 FBEafeUtwOXR3VffUKJJr49+nnPRBcv2DyUlDrPW6SA9EqlS/QTIsN/hZfb9hTSvJUkQkwUPj/b
 KIqCv47XPpin82iWqR8YZNWetTT7Yw66W1p1zHGYjiBKgBAl6cD3t8773ljd8xuFAb3TrTm45Y3
 sp6nUH+uIwm2TIE3ddIjGelHQzQyIOhOQwNoPVNt4Lk2r482Pi2EWyCCGviNXATyreIJ7aK4yLJ
 S4RwEEXIZnDImAwSSzJEMBMFMq8VIAMsFB20BD+kGXTgR6+uUVYNiC5KiH1bsCwbVb4tYJqcTY7
 nbPxBqkYiW8PYIu3QRGVYzupBsP8WdON64GKQgCRb1rDs3bYeH62aMAyQy0kkgAWyfE+1H0mUBZ
 6Hth1A2KMYzjPze9s2PAdB7ZchtCIklgvCY/U0ICjFG4pHQPPiwcbCoHj61kdOuAB7HZPrIRzod
 mxPHEtMzxBMexmFQHgHL/nk1PzTSfM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This series try to fix parent clock of UFS aclk which was submitted as 
wrong version, so correct it according to updated doc[1] here. Also, add
a UFS reference clock which was missing in previous patchset.

Link: https://www.spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/17_clock_reset.md&lang=en [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (3):
      clk: spacemit: k3: fix parent clock of UFS aclk
      dt-bindings: soc: spacemit: k3: Add clock ID for UFS refclk
      clk: spacemit: k3: Add UFS refclk clock

 drivers/clk/spacemit/ccu-k3.c                  | 10 ++++++----
 include/dt-bindings/clock/spacemit,k3-clocks.h |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260603-06-clk-ufs-support-680f72874490

Best regards,
--  
Yixun Lan <dlan@kernel.org>

