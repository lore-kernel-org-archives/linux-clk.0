Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUUpOrdg"
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498A0BD;
	Sun, 10 Dec 2023 09:19:17 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so640128a12.0;
        Sun, 10 Dec 2023 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702228756; x=1702833556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ/wf0TFY3jIklXy55GzkHPDNA98SpFq1MQxY2HzAuY=;
        b=TUUpOrdguyBa9IdyXb6l2rYyGQKtb2Rlvx9P7R7h7pyTTxFEKuHpP5nqQ7Y5p3mgs2
         BLG30TblO/UjCt/Nvj9giWCyMps0Ff91vgSkvfJKqSIWDmXfEB8Jq861/IGigwTZijtv
         Gx2TgJf0YmHqZLdev2ueNapy7qlRF616wuCb1ScA640C0MRdgOJ9VoD1U9e5Eu3U5by/
         cF7elkJ8SPX2pFgdxsbXLY9/MuwHk3GT7iQJGp5/r9KfZ9IBlsErv00TPSUlm0WjBQrN
         zjwqNEVOpvqezKfIGd4qiQzvC3iFN7/MUbfpLvmcdAx9C3C7r1WAfT17krdilRCqSfZY
         R6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702228756; x=1702833556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJ/wf0TFY3jIklXy55GzkHPDNA98SpFq1MQxY2HzAuY=;
        b=RKDDfHpv9ogjnr3Ql6fEMHTFKxAc0in/OzhFA/Q+Z2Pj6r9wR5bM4t+PhugtzuQDCZ
         k1HBZTQKlZ3oxCZOffS1ZUYFtUwjbXJIQP5K1PWmXWXaCBOGfJrvTrAHAkUtzakSZFSi
         wfyaJUReiOaA3U1/1sIhqz3/KugKsAaA30cLyrLvQ7fP5oFms85/lMCJf6ZG6GhXMngU
         lMLAVSyWCqfc9UFUA7hvkkrx5JSMDNXi4Xzl30KV+RosVrQ5wp/ODUSgCF5Z/348DXL0
         GYUkGPF5/DIV/tWin7and4jelPs8OpcbHzMlPMcePb7bjVKUxNSPtX6ZIY8bDHY/uj8h
         NpQw==
X-Gm-Message-State: AOJu0YzUqPtqZE4ifCwed3CCrYmFceltHZchO6bM9S8KVhgdxS1oH1UW
	bp8AQ1SfpoBHgS3bXrDmq8Y=
X-Google-Smtp-Source: AGHT+IHQb332XOYEfPhZRtEl4QLywKUOti5zdZlXfbGfGxO0RUFtNeJgzLpREEUN2NkCaiuK6oK9Cg==
X-Received: by 2002:a17:902:ee81:b0:1d0:5efd:35cf with SMTP id a1-20020a170902ee8100b001d05efd35cfmr5966163pld.4.1702228756529;
        Sun, 10 Dec 2023 09:19:16 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902bb8200b001c62b9a51a4sm4976264pls.239.2023.12.10.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 09:19:15 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: abelvesa@kernel.org
Cc: peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] clk: imx: scu: Fix memory leak in __imx_clk_gpr_scu()
Date: Mon, 11 Dec 2023 01:19:07 +0800
Message-Id: <20231210171907.3410922-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cases where imx_clk_is_resource_owned() returns false, the code path
does not handle the failure gracefully, potentially leading to a memory
leak. This fix ensures proper cleanup by freeing the allocated memory
for 'clk_node' before returning.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clk/imx/clk-scu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index be89180dd19c..e48a904c0013 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -886,8 +886,10 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_na
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (!imx_clk_is_resource_owned(rsrc_id))
+	if (!imx_clk_is_resource_owned(rsrc_id)) {
+		kfree(clk_node);
 		return NULL;
+	}
 
 	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
 	if (!clk) {
-- 
2.25.1

