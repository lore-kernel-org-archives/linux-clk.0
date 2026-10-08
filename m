Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDB125771;
	Thu,  8 Oct 2026 02:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791428294; cv=none; b=I6I1N3VhNqvTA0SviXp91ssUeO+Xrb9FyIyr77on5Tx62C7rV3HagGgdgsB56OSY9Zs93fForS4K+2nX0xGoorozzEzuJ5P0nD2BGT9jaK+wVU01Ow61Hd2Vo52IicKN27xGAE2SoNK9WoqFfIcE4+wlC+7y66R8BmKaeWOjLH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791428294; c=relaxed/simple;
	bh=cHbILVKSdizFNPE4GEMMhNM1jFSHqMY5od3vYov6rSA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M15jLSfb7blYa8QRYcmwPe3bp4xehPHWY8nogmxHEj1juhZIOebnxeqz4l4oiIOAV/u07pexg5phraVkkIPU0pE/OT25ICdctnWyJOeyBugt+veGFP7z0BWO7lDF343mFQda1OirZzU/veTFswFWLXsstlH73vW/j1HebjesrT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A25DeaQh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A25DeaQh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3141F000FF;
	Thu,  8 Oct 2026 02:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791428293;
	bh=kqQFBKuueEa6Y0WgZw0AeqBkSpOARrf4znZxbkxqu7c=;
	h=From:Subject:Date:To:Cc;
	b=A25DeaQhdfV9zQRboNNmj4SYXFFZ7xtbDE6aNJ1e83lub7wAuWaKF35VltWK2sayF
	 W0I1Is5mB3mWdzthWIKnWh/nxSWm2JhF1Bl6Z/C2dziXw3hg6VrCnJcBbPDPTZ0zWZ
	 AKoaaI0IzgWZw1PfzvE3ZfkvyGux8EC3HXMuwn4IHliKRJneygZAo0r4WfAbbkUupQ
	 Aj2006Ms+vwYR2Z85Oapxv5St86MviIS3ZVPEc8pJveqOVOZdkRbc52AGPN9dDlNDH
	 Gl143Xi/oYe9xjHYI3OcpNd884tpzKDb8CC7CGXc7K4CUCt0cRU6ZDkZnzJIt4lRtl
	 Wm6taqbOVTlxw==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] clk: spacemit: extend to support pm domain driver
Date: Thu, 08 Oct 2026 02:57:54 +0000
Message-Id: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDswakjEq5Qu0jjq+FdJqgji3
 Y26/Bbv7RDYCwcokx08rxLkN0WkrwRca6eGUapoyCjTKVGBpLDP0Q09ziPaZUOTG63IKK2tg5j
 NnmvZ7uX78zgs347d//rAcZy6z8zQdAAAAA==
X-Change-ID: 20261008-04-k3-clk-pm-aux-7376407466ac
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Alex Elder <elder@riscstar.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, linux-clk@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=dlan@kernel.org;
 h=from:subject:message-id; bh=cHbILVKSdizFNPE4GEMMhNM1jFSHqMY5od3vYov6rSA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqxwa3CVMliR1Pf+TzndmUndjvfjIsh/fxobPrd
 uxGemsKcxKJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCascGtxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+29CQ//RD/mM/4hWKkiJ4PA+22Q6lyJkZKFWszlUg6sxXmr+OjqfMOsV2Xyu
 JtlaGQKKtcpArvZvWlp7V3y63FwfGh4DlFeyPu/w+lnstSvdfi78KlVfW+jEoLfbAJ9Tl9OII8B
 +tJc5YBKyY1fdi6c3O4xEeUKZkdrLCUgTdsqySmX6XYWmnIFL33GTgL5wt/rh/t4AeTHOmmwwU5
 EnkUqEfYfOFFA2m25tS60MWFXt4mtDUkxjBmNy+uGql5LFjrNYgc/dpOq23Bm9uWIeC2GYSXBVO
 vF45wVYJZjG5LX2lwSpTlRnLVKUzy1dljhDP+LuaCP4mX92d4pfHO8djVkER7mhCrWz6Du4yqrM
 yphrWO77pYYtoPFBtZ9eQbE6diFdWjz9pZPxrbVhuMONJVYPMBzc8AH5yHARxydC5TMdbbUd/mu
 Z6mXj6mwKIVZJoakwFlPGQHBXTi+5FbogQizPQTFiFzOaS79/e6ms2virl/pk5d9U6bG9GOIqXE
 szx28DIOx0v/2K+9x8AUACYF0d52Kzkjt1z/b9WVG9XRocMdFJM1KhTdJE4sa3FdjIklcLYpL2x
 f2WL1HfHrqGfr99xaIRTGfQBBfvqfJhTJS3eahyRWVfIKVeo2xy4TiOWpuYNL1KX8Y9YWLw9RR4
 PMIi1tCCv9Z4mcRmJQNq4TqiWolqBU=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The APMU (Application Subsystem Power Management Unit) register region block
not only provides clock and reset support, but also the pm domain management
capabilities, so registering pm domain driver via auxilary bus is feasible
way to go.

The series try to extend the CCU driver to do some preparation for addition
of pm domain driver via the auxilary bus.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (2):
      clk: spacemit: rename to generic ccu aux register function
      clk: spacemit: register pm domain auxiliary driver

 drivers/clk/spacemit/ccu-k1.c     |  1 +
 drivers/clk/spacemit/ccu-k3.c     |  1 +
 drivers/clk/spacemit/ccu_common.c | 16 ++++++++++------
 drivers/clk/spacemit/ccu_common.h |  1 +
 4 files changed, 13 insertions(+), 6 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261008-04-k3-clk-pm-aux-7376407466ac

Best regards,
--  
Yixun Lan <dlan@kernel.org>

