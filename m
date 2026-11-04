Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.190
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779873;
	b=qAIePsl6OmIOAEHXy6tL7W+QeAMA4J1dAYx9oFPQM0cPpcNY6+A7nP3IZFV0JMlhB6Zm
	 uhLhtix6aAZpo0dXXRy8Zm3TfmzjFf1wWvT6BSoO4I6UeeqzXEqVuxxK+Irlfm/eyvxy8
	 PMOm29WS9TwcyQR6mH0bbO9uxRM1UcM5X2/rClVnJlsWo9S4eRO/3PSMfG5DM5yfvqi8S
	 /1ujFiHnlkq+izuQxCe520dUfor3mHlww6Zc+9cX0kqdAGX7bOG0h7r4HNfLxQu/ZUEUe
	 MYKi7+F0f9U9YlzszPFCMpXBltIT5INFs9F+dPmeuwnV12/EpwPes0P1O9LLlYtsI3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779873;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=gF29lVl8HY9M/hv2wsnrcjRNlNM9ZPm3tn3+eQc+KAo=;
	b=qs6XrK+2y1EEjRGuG4+Gt4jej3McIOeReXbZsg2bped/rIgwJTKDok0rkhGViOuTWywl
	 eDpTtfHC6ZtZc3hwsyeGwngXgy7yJQp+aFFOQz6RlGmTRVD7q7xY5lBQRKx7PpqK5B0hd
	 2UWqacIVxAGJtf4/n0wxEdzC86JHOuhZhcaomj1j0oB2bRmgsI9JWsFFoOPHdz9Yt+c58
	 /vYDb0N8RsAhkEjXW4fS2qdd1VUWIHnPpi/XRyEn2kVlgFsSaoHIyyYqg7LzSZ5TkksAZ
	 TBi1quNgO/Pk3USjD2b9SV9rrLQbCTg3Nde6H2jBa3r7lrRI8p3GgPm6A09iX1iu9LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=TRqapx6v;
	arc=none smtp.remote-ip=203.205.221.190
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB06606A32E;
	Wed,  4 Nov 2026 08:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB06606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=TRqapx6v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793779869; bh=gF29lVl8HY9M/hv2wsnrcjRNlNM9ZPm3tn3+eQc+KAo=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=TRqapx6vmU271M8ykSTL3r7nEcjuL/Xg2+At7cL2hGRnGY9dktAXdNk3Wf/nmDw1I
	 O1vcaPWgebY8QNyzgV8ZkOLIUcjoDvM7GS30C9ufY/BuuZ699wBE5xDKDO5/CfDRHm
	 Aiu3eRK8gZTagxuJHgC7TVjfVZp7J/SlPkSXBRIk=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-XMAILINFO: OBsY42vIixr9voHNmCSGxNYclsdG6Sal1N5wgHw975+B912JHF825Qw4JPgdgT
	 BL7Ap/HQJUY9RvLbpyZBdsClTIdXYkTofIeyOoO/oXJU9HOsiq35MUo9jcpN5B3Ox/bcWYeAP0cxA
	 MjvPlhgfRX0lmezpiDc0TnHSBhNSDJLMHgLotsTlYJ8L9CHU8+AhvXLscg/RYbe8sH3hJaJwMSwBT
	 IcviMkBtmt46x1SLAkPTkauNbMXaDgj9Os2p6FqP7KAFuE+FPrz46LEzZJxiYA17CNEkeRbC8LjPW
	 KDhumM29TAY0FH5wAWYDCCPxZscshbLus7f7+DexD6IeoB5rxUZXhYUOD4yV3oMrGqhbqPkK5VWdX
	 5kiGRMWAJ2EmVYIE5mSkG3af5u9rHt2Yp9Eh9/bzkR4KlIDjjwNoMCxUiMxNbSdu5OzFEPv4eOGZs
	 m2KD0f/JvEfD3ShdfMf9uhKTj4Oymny4ScVgb3WntnFFKq3UHBK9OSEI8x544jMnm7w+1+yqHFAFU
	 oXmch/Zk29Q1oCawqXNnhzksAgDZcTuEAB3cciI6FvcI7eFtnQPHIBJEAAhwR+gCeIWqZfqHOb3RW
	 UD7AFZgp5HyimOEAYZM0XreHls4bElj0pgA+zzKO8rpGkl611FboPBa2/dE9Vd7izhlC+FYdJM9XD
	 qPsVbabYhPlOoYSH8cBjGQM+9Zk/Z8lLfHy3PMLEaXLIGUOhyf4d3q52FRxmO6/TTAM6jRShgL9SN
	 oQwcFbpAvoAedltVZAVmKuKInn5CZ6JAt3vMBF44AwDRbYjAGhP5gT1MIpy3vD5OSsxRPLC+obwkX
	 zmxLtVGR7HGSMGuiHMEuYFSMDsAOhPuRI5m0EJiy+iLtxkJX4N/nJAva76tPdE1BLjAelqsnrE4qZ
	 GxSM82Y/bejBLqqUZ1h0gDfo++eA0GaLSwBEnDDjIoOezXUNk1PceiIIEEWtX79Kal1O/FBpZMI1M
	 nyUN7PzsR1RGj/J6nHCwIVy3Nm6m38XCfVLshvi4aVqI6tSassNe0GkxGNGe7gljEl/oF1LIuuxCZ
	 SF0jQ7WFkRFOEPv714u2/VLEhTxvKak7V89p5
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?VGhpbmggTmd1eWVu?=" <Thinh.Nguyen@synopsys.com>
Cc: "=?utf-8?B?bGludXgtY2xrQHZnZXIua2VybmVsLm9yZw==?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZw==?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw==?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc=?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 23/27] usb: dwc3: Configure RK3572 PIPE port before discovery
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 4 Nov 2026 16:11:07 +0800
X-Priority: 3
Message-ID: <tencent_B554CB5826E48E2405EC22E6FAED3721D10A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <20261022-add-board-ok3572-c-v1-23-0b0fd85a31ee@qq.com>
	<auqRrz1kM-sfJEQ-@vbox>
In-Reply-To: <auqRrz1kM-sfJEQ-@vbox>
X-QQ-mid: xmsezb41-0t1793779867tvkd8y3x2

SGksCgo+IFRoaXMgY2FuIGp1c3QgYmU6Cj4gaWYgKGRldmljZV9wcm9wZXJ0eV9tYXRjaF9z
dHJpbmcoZGV2LCAicGh5LW5hbWVzIiwgInVzYjMtcGh5IikgPj0gMCAmJgo+ICAgICAoc3Bl
ZWQgPT0gVVNCX1NQRUVEX1VOS05PV04gfHwgc3BlZWQgPj0gVVNCX1NQRUVEX1NVUEVSKSkK
CkFncmVlZC4gVGhpcyBnbHVlLXNpZGUgY2hlY2sgd2lsbCBiZSByZW1vdmVkIHdpdGggdGhl
IGhlbHBlciB3aGVuIHRoZQpjb25maWd1cmF0aW9uIG1vdmVzIHRvIHRoZSBQSFkgZHJpdmVy
cy4KCj4gVGhpcyBsb29rcyBsaWtlIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBkb25lIGluIHRo
ZSBwaHkgZHJpdmVyLiBUaGUgb3RoZXIKPiBSb2NrY2hpcCBwbGF0Zm9ybXMgc3VjaCBhcyBS
SzM1ODggZG8gdGhpcyBpbiB0aGUgcGh5IHJpZ2h0PyBXaHkgaXQgbXVzdAo+IGJlIGhlcmU/
CgpZb3UgYXJlIHJpZ2h0LiBJIGNoZWNrZWQgdGhlIFJLMzU3MiBoYXJkd2FyZSBjYXBhYmls
aXRpZXMgYW5kIHRlc3RlZCBhClBIWS1iYXNlZCBpbXBsZW1lbnRhdGlvbiBvbiB0aGUgT0sz
NTcyLUMuIEJvdGggY29udHJvbGxlcnMgcmVwb3J0IERSRApjYXBhYmlsaXR5LCBzbyBEV0Mz
IHVzZXMgb25lIFVTQjIgYW5kIG9uZSBVU0IzIHBvcnQgcmF0aGVyIHRoYW4gdGFraW5nIHRo
ZQpob3N0LW9ubHkgcG9ydC1kaXNjb3ZlcnkgcGF0aC4gT24gVVNCMSwgVVNCMyBQSFkgaW5p
dGlhbGl6YXRpb24gaXMgc3RpbGwKY2FsbGVkIHdpdGggdGhlIFBJUEUgcG9ydCBkaXNhYmxl
ZC4gTXkgb3JpZ2luYWwgcmVhc29uIGZvciBwbGFjaW5nIHRoaXMKYmVmb3JlIERXQzMgY29y
ZSBwcm9iZSB3YXMgaW5jb3JyZWN0LgoKSSB3aWxsIGZpeCB0aGlzIGlzc3VlIGluIHYyLgoK
QmVzdCByZWdhcmRzLApDdW5oYW8gTHU=

