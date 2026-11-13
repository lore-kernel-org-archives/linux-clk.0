Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530144;
	b=eRLXf/EzPRr4St8pp7Pt7RWoFhdIvJrwRmS8skjhTiqDNa/XItIb6ejDcD0RFd5tsarQ
	 HDquXluYDryKF8NmCvddv4W6kEa5QHpE2WZ8N8QBuf9+r0dY2RouBYrXQidPcKD1elNa7
	 o5I9Qx8n/zvW2gVGFpCEjqCtkYQsEjNJwU4TN+LbswPnN0sKhduXkesjkATsfc+NtPPcK
	 UzEx3JvXS7wEkQUh589lF0xQYw7Jx17m4dC19BfI4Vgi3xH8jIaKggvhcEaduUoKn2JF/
	 iu5LWcJV/ohUy0EsbTDY/2OL+SQDRkfU3C6FTulde6BJxcAC4OALojhgqrnsO3LZxmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
	b=hr1SKRdhRQgz1RtOvzL+Kt3g5gkIgWjj7NOyfndaVP/Uk943BUXVyblDI3wW+MjwRML4
	 FuFdKtJCkkwoU68WrL/lVSEJT7SbHpKJ95QfQXA/+UJYPXsX16B2UA4kxSVgVWeZ64zo9
	 wzhAkZeZa/V6qwZjXKfqdXRLTQVQky6lAMxlegRW3oOBoq4p/TO3giQYxsEJVRmjL3X6Q
	 1fksz5NtiCy96UeGd2x5QCKPujVEt0Z51PJ0gV5aLrC1niUL6qly8NlSGLCQsYH1j2iXK
	 cSU1iHaUoOYFj2qOnHaep870ERGcXG0pl64gA1vS3nxCtgmGNn0Es2JccCQwnm2HnLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9kFqplF;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BBD606B7C6
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 00:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BBD606B7C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9kFqplF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso112138f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 16:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530142; x=1795134942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
        b=b9kFqplFB4ksjcPB11g7wrzFIgvzhQf4VQ4LwRLiHJrvjQT+Z84PDUc7IV2LD5JEPl
         ZmMlqSn9Zfs6NtZ5wlylT9/0/DhKh8W90+YzWktylsMglqS0lxW/g71dgzPKRJ8jt9IY
         JLK24g9M5vDKhDWDxa1bRSz4655xxriCK1KUYGW1mNMUcX6vzl47Gp8Mlw5DtFUJ/RsJ
         wO5PfU4yhMpc3rzSJg2zZFSD5xQTCBEGbrzXzByK8OhXHaWtE/RXDBYwZNv77HkmOBcv
         l+X3FQNWyF7m1Vg8n7ekhqOs8ngNSPfEAOWc8Dwzx2HOPa01dBCIlB9bWvkjlDMsCdRs
         OrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530142; x=1795134942;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
        b=V4o7cFr5mAxkuBx7E1uzjRYxs8B2CGz4lomQBAlhlC8MSKf1kW049caXSKE8tj+y6Y
         8df6jBmfFBSGPBQ/AGdpmKBph2E4OIt3AuzOUkys8x89E2r7oO3jV0Fz3bCYbMBIkpAo
         EoUCCgnIrb9DnaYiGNdBNVle+9w1Jl7bwSGBBmLOWTbd3Gz02ivV/8PhgFTm2M5DYNQC
         aJ7tHE6ximAx441Eldf6CRqFaZen9S2Gry+/zFQaJrkUt+tH8HrF7I+CuP72FjNjeufK
         SZWk/a7c9n642EE3ILjvnCfFcEaB0MI3sXOHxOafW+/vGJQluNUMJ5Eddc5+HqmcrUKh
         sSFA==
X-Forwarded-Encrypted: i=1; AL+hErEpvZKJwyd2EXuiTxVwcvsu+HKstLgP8DDxSW7Q7GwjgXLTLLAS4LP5ZhCRpAQIcJJoL4uV+5CVpMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z81LrE8+YMpI+dOFwESdgdMZWUYo2BPHiKU7FwWr+EbAIeh8daq
	SbcP4hgEmzTFawIBH9wGFEy166FrjYE1bRPJsgoJDwCcCq1qZeI7LxKu
X-Gm-Gg: AYBFou0m9KOC5MAM8xoaUqNepymZ/AQloGqyHGkC+erqmcDC6W+pC9nuUziQDFWZ9Fh
	Ojyjh5q6K95FuNZdEEC9J/LZ9Wk9hIFvuX+y0jABmhNkmHxtNePYcZW2fgi85gCzdMHSMI9ZsDa
	BzEL1lTb4pZfg2cajfHKnsIcQKO/ClthL1dzBniI5PUXskGvsPa2rkc2Cw4FMxR7DY5ruQ6tx5l
	aeobWvTMilLZxxXV/vL1hiz6SN//6xSKk6tOo7QI5YggsSJUUZRLRJSu60ILk3840EKT7zTdEXx
	NgQyCzxuMgJWfumqMmSeRAEEXahem7TyyX5iz6gW7iZWeBsZ8uzWO2hqmqtEkQUobzrtgh/Y7gk
	B4Sr8aj0XNdw2t+9CrG99LlIk8ZXcWetHGf75T0XNX0MliCMuvKF1jChJDg2SIkyPY8Ps1UKkHE
	NNruuIxKL0VOvIOfe4a9+Hvh15e8W8T3TANRoIceesVzXtNNDIyp4d9n8KA3wDiodz3LLahEd7f
	Hldwy4dVp2smhJl5I6W5epShAb+i68Nh9/AOGlgsYRA248j6ME3EDzRhT1uEa0hR5QyD5piSMss
	262SYBq0foIOCYvXdedDVAFNOCdhgwRaWl11ryM01P8YhhGxjCXa+TaZOxRupFUJis3z9MOQLAP
	mP9Em4ypB8usTXqxb+Q8Xrkg/85rYHeSPfVPzQwcCrN+ObSB/Mj74KgKs9PHAzPbi3sjSjN3xkr
	0Gbf4nkeXnPNaQ4NjK
X-Received: by 2002:a5d:6f05:0:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-49c723fc07dmr1853264f8f.21.1794530142217;
        Thu, 12 Nov 2026 16:35:42 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm2251812f8f.45.2026.11.12.16.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:41 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Fri, 13 Nov 2026 00:35:40 +0000
Message-ID: <20261113003540.3660753-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-5-ghahramani.navid@gmail.com> <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Stefan,

Stefan Dösinger wrote:
> This would be easier to review if it were split in 3 patches, one yaml per
> patch.

The next version will have one binding per patch.

> Afaiu this makes "syscon" optional. Why do you need syscon? Why might you not
> need syscon?

It turned out I don't need it, so I dropped syscon from crm2 in my
tree. All I have found in crm2 so far are the PCIe clock gates and
resets.

> I think you should be the maintainer alone here, I don't have the hardware to
> do proper testing of patches.

OK, I will be the only maintainer there.

> I think splitting those into different bindings is still a viable choice.

The next version will have separate bindings for lsp0crpm and
lsp1crpm.

> You can drop the phy child node and just add "#phy-cells=1".

Will do. topcrm gets #phy-cells = <1> and no PHY child nodes, and once
topcrm is an MFD the PHY driver will use device_set_of_node_from_dev()
like you described.

> I'd suggest to rename clock/zte,zx279128s-crm.h to clock/zte,zx279128s-clk.h.

Will do.

> Do they all need to be exported? You only need those that will be used for a
> clock = <&topcrm ZX279128S_TOP_SOMETHING> handle.

No. The next version will only export the clocks that device tree nodes
use, mostly gates, and the PLLs stay inside the driver.

You also asked on the RFC whether lsp0crpm really has no resets. I have
not tested that yet. I will try your method on the router, clearing the
bits, seeing what breaks and then checking whether the device kept its
state, and I will reply with what I find.

Best regards,
Navid
